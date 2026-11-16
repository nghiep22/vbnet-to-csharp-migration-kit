---
name: vb-baseline
description: "Capture a reproducible build and behavioral baseline for a VB.NET application before migration to C# .NET 8. Use for characterization cases, legacy diagnostics, output and side-effect capture."
license: MIT
metadata:
  short-description: "Capture the legacy VB behavior baseline"
---

# VB Behavioral Baseline

Bản thiết kế chưa kiểm chứng trên ứng dụng thật. Thực hiện trong phạm vi người dùng giao và chỉ dùng công cụ thực sự có trong phiên.

## Đầu vào

Source snapshot, build/run commands, môi trường nguồn và luồng/dữ liệu kiểm thử được phép.

## Đầu ra

Log baseline, environment manifest và case tham chiếu có input, expected output/exception/side effect.

## Quy trình

1. Xác định build command hiện có, SDK/VS/MSBuild/targeting pack, config/platform, private dependency và cách chạy ứng dụng.
2. Build bản VB nguyên trạng trong vùng output kiểm thử; ghi command/exit code và warning/error có sẵn. Không sửa nguyên nhân gốc rồi gọi đó là baseline nguyên trạng.
3. Chạy test sẵn có và chọn luồng quan trọng theo người dùng hoặc bằng chứng. Thiếu test thì thêm characterization test ngoài boundary nhỏ nhất phù hợp.
4. Ghi input, culture/timezone, architecture, result/exception, file/DB/output/event effects và nondeterministic fields được chuẩn hóa có lý do.
5. Lưu nguồn baseline độc lập với output converter; dữ liệu synthetic chỉ dùng cho thử nghiệm tổng hợp.
6. Nếu app không build/chạy được, giữ not-run và kế hoạch phục hồi; không tạo expected output từ suy đoán để coi đã đối chiếu.

## Kiểm tra kết quả

- Có thể tái chạy command trên đúng snapshot và môi trường.
- Expected results có nguồn VB tham chiếu, không phát sinh từ bản C# mới.
- External effects dùng sandbox/data kiểm thử trong phạm vi được giao.

## Đọc khi cần

Khi thực hiện skill này, đọc [hướng dẫn chuyên biệt](references/guide.md) để chọn case, bằng chứng và tiêu chí hoàn tất phù hợp.
