import CSkia
import SkiaKit

let bitmap = try Bitmap(200, 200, isOpaque: false)
let canvas = Canvas(bitmap)

let sample = TwoDPathSample()

sample.draw(canvas: canvas, width: 200, height: 200)

print("RAN")
let pixels = bitmap.getPixels()
print(pixels)

let stream = SKFileWStream(path: "test.png")!

Pixmap.encode(dest: stream, src: bitmap, encoder: .png, quality: 100)