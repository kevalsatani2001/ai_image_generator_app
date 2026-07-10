import 'dart:convert';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AvatarGeneratorService {
  final String _apiKey;

  AvatarGeneratorService({required String apiKey}) : _apiKey = apiKey;

  /// Validates the selection is exactly 5 images.
  /// Throws an [ArgumentError] if the selected image count is not exactly 5.
  void validateImageCount(List<XFile> images) {
    if (images.length != 5) {
      throw ArgumentError("You must select exactly 5 photos of yourself.");
    }
  }

  /// Step 1: Send the 5 selected images to meta-llama/Llama-3.2-11B-Vision-Instruct to analyze facial features
  /// and output a descriptive prompt optimized for Pixar 3D style image generation.
  Future<String> analyzeFacialFeatures(List<XFile> images, Function(String) onStateChange) async {
    validateImageCount(images);
    onStateChange("Analyzing Faces...");

    final List<Map<String, dynamic>> contentList = [];
    
    // Add the text instructions first
    contentList.add({
      "type": "text",
      "text": """
You are an expert AI facial analyst and character prompt engineer. 
Analyze the 5 uploaded photos of the same person. Pay close attention to:
1. Facial structure and shape (oval, round, square, etc.).
2. Hair style, color, texture, and length.
3. Facial expression (neutral, smiling, etc.) and eyes (shape, color, eyelashes).
4. Distinguishing features (glasses, facial hair, nose structure).

Based on these observations, generate a highly detailed and descriptive text prompt for an image generator to create a "3D Pixar-style animated avatar" of this person. 
The generated prompt must be highly detailed, aesthetic, and emphasize Pixar's characteristic expressive eyes, soft lighting, and clean clay-like textures while strictly matching the person's face. 
CRITICAL: Output ONLY the descriptive prompt text. Do not include any introduction, explanations, markdown quotes, or formatting block syntax.
"""
    });

    // Add base64 image data items
    for (final file in images) {
      final bytes = await file.readAsBytes();
      final base64String = base64Encode(bytes);
      final String mimeType = _getMimeType(file.path);
      contentList.add({
        "type": "image_url",
        "image_url": {
          "url": "data:$mimeType;base64,$base64String"
        }
      });
    }

    final url = Uri.parse('https://api-inference.huggingface.co/v1/chat/completions');
    
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      },
      body: jsonEncode({
        "model": "meta-llama/Llama-3.2-11B-Vision-Instruct",
        "messages": [
          {
            "role": "user",
            "content": contentList,
          }
        ],
        "max_tokens": 500
      }),
    );

    if (response.statusCode != 200) {
      throw Exception("Hugging Face face analysis API failed: ${response.statusCode} - ${response.body}");
    }

    final Map<String, dynamic> responseData = jsonDecode(response.body);
    final List<dynamic>? choices = responseData['choices'];
    if (choices == null || choices.isEmpty) {
      throw Exception("No text choices returned from the facial analyst model.");
    }

    final String? generatedPrompt = choices[0]['message']['content'];
    if (generatedPrompt == null || generatedPrompt.trim().isEmpty) {
      throw Exception("Failed to analyze faces and generate prompt.");
    }

    return generatedPrompt.trim();
  }

  /// Step 2: Pass the generated prompt to stabilityai/stable-diffusion-2-1 model on Hugging Face to create the final avatar bytes.
  Future<Uint8List> generateAvatarFromPrompt(String prompt, Function(String) onStateChange) async {
    onStateChange("Generating Avatar Image...");

    final url = Uri.parse(
      'https://api-inference.huggingface.co/models/stabilityai/stable-diffusion-2-1',
    );

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      },
      body: jsonEncode({
        "inputs": prompt,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception("Hugging Face Image generation API failed: ${response.statusCode} - ${response.body}");
    }

    // Verify response content is binary bytes (Hugging Face returns image directly)
    if (response.bodyBytes.isEmpty) {
      throw Exception("Empty image payload received from generation server.");
    }

    onStateChange("Completed");
    return response.bodyBytes;
  }

  /// Helper to get MIME type of the file based on extension
  String _getMimeType(String path) {
    final lowercasePath = path.toLowerCase();
    if (lowercasePath.endsWith('.jpg') || lowercasePath.endsWith('.jpeg')) {
      return 'image/jpeg';
    } else if (lowercasePath.endsWith('.png')) {
      return 'image/png';
    } else if (lowercasePath.endsWith('.webp')) {
      return 'image/webp';
    } else if (lowercasePath.endsWith('.heic')) {
      return 'image/heic';
    }
    return 'image/jpeg'; // fallback
  }
}
