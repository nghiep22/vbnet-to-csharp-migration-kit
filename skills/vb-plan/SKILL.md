---
name: vb-plan
description: "Create a dependency-aware migration plan from VB.NET to C# .NET 8 assessment and baseline artifacts. Use to select language/runtime sequencing, workload strategies, task acceptance and unresolved architecture decisions."
license: MIT
metadata:
  short-description: "Plan migration tasks and evidence gates"
---

# VB Migration Planning

Bản thiết kế chưa kiểm chứng trên ứng dụng thật. Thực hiện trong phạm vi người dùng giao và chỉ dùng công cụ thực sự có trong phiên.

## Đầu vào

Assessment, source snapshot, baseline status, constraints và target/workload decisions.

## Đầu ra

Plan/task graph, decisions, risk handling, verification matrix và rollback boundary.

## Quy trình

1. Đối soát scope và finding với source snapshot. Nếu baseline thiếu, thêm task phục hồi và đánh dấu dependency của mốc cần runtime proof.
2. Xác định library/public consumer, project references, chu trình và binary dependency. Nhóm project cần chuyển cùng; kiểm tra tương thích TFM khi chuyển từng phần.
3. Chọn language-first hoặc runtime-first theo toolchain POC; không tự chọn converter latest hoặc đổi target của người dùng.
4. Chọn profile web/service có quyết định UI/contract cụ thể. Liệt kê package giữ/thay/tách, COM/reporting và external integration cần môi trường thử.
5. Mỗi task ghi input/output, dependencies, files/rules, acceptance, tool versions, evidence và cách đảo thay đổi thuộc task.
6. Tách test/build, semantic parity và workload parity; đề xuất estimate dựa trên unknowns/fixtures, không đưa phần trăm tự động hóa chưa đo.

## Kiểm tra kết quả

- Task graph không có dependency không tồn tại hoặc chu trình chưa giải quyết.
- Task quan trọng có acceptance đo được và evidence cụ thể.
- Quyết định ảnh hưởng UI/contract được ghi trước bước phụ thuộc.

## Đọc khi cần

Khi thực hiện skill này, đọc [hướng dẫn chuyên biệt](references/guide.md) để chọn case, bằng chứng và tiêu chí hoàn tất phù hợp.
