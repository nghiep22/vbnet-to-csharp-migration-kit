---
name: vb-assess
description: "Assess an existing VB.NET solution for migration to C# .NET 8. Inventory projects, workloads, dependencies, entry points, data access and VB semantic risks, producing source-backed survey artifacts without converting application code."
license: MIT
metadata:
  short-description: "Assess VB source with traceable evidence"
---

# VB Source Assessment

Bản thiết kế chưa kiểm chứng trên ứng dụng thật. Thực hiện trong phạm vi người dùng giao và chỉ dùng công cụ thực sự có trong phiên.

## Đầu vào

Source hoặc solution, mục tiêu C# .NET 8, mode static/semantic và thư mục artifact.

## Đầu ra

Inventory, architecture/function map, semantic risks, coverage/unresolved và danh sách câu hỏi còn thiếu.

## Quy trình

1. Kiểm kê solution, vbproj/csproj, code, Designer, resx/settings/xsd, web markup/service contracts, packages/config/props/targets và deployment files.
2. Đọc project options, RootNamespace, imports, TFM, OutputType, architecture và project/binary/COM references. Phân loại workload theo nhiều dấu hiệu, không chỉ folder hoặc extension.
3. Chọn static khi thiếu môi trường; chỉ dùng semantic khi MSBuild/Roslyn load thực sự thành công. Ghi unresolved references, compilation coverage và configuration.
4. Truy từ Form handler/controller/page/job/service operation tới logic, data access và external integration. Gắn file/line/symbol cho nhận định; phân biệt fact/inference/unknown.
5. Lập finding cho Option Strict/Compare, conversion/ByRef, event/My, lỗi kiểu VB, resource/reflection và API Framework khó port.
6. Sinh báo cáo theo module, index tổng, dependency graph, risk register và missing evidence; giấu giá trị credential khỏi artifact.

## Kiểm tra kết quả

- Không gọi scan XML/cú pháp là semantic analysis.
- Các file bỏ qua và reference thiếu đều có lý do.
- Assessment không sửa source và không bịa quy tắc nghiệp vụ từ tên class.

## Đọc khi cần

Khi thực hiện skill này, đọc [hướng dẫn chuyên biệt](references/guide.md) để chọn case, bằng chứng và tiêu chí hoàn tất phù hợp.
