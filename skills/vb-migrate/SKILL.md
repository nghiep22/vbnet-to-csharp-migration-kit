---
name: vb-migrate
description: "Coordinate assessment, planning, conversion and verification of a VB.NET application to C# .NET 8, including mixed solutions and resuming a prior migration. Use when the request spans several migration stages."
license: MIT
metadata:
  short-description: "Coordinate a VB to C# migration workflow"
---

# VB Migration Workflow

Bản thiết kế chưa kiểm chứng trên ứng dụng thật. Thực hiện trong phạm vi người dùng giao và chỉ dùng công cụ thực sự có trong phiên.

## Đầu vào

Phạm vi người dùng, đường dẫn source/solution, target, configuration/platform và artifact/state nếu có.

## Đầu ra

Lộ trình theo workload, bước hiện tại, task tiếp theo và trạng thái kiểm chứng trung thực.

## Quy trình

1. Đọc yêu cầu hiện tại và chỉ dẫn của dự án. Xác định người dùng yêu cầu khảo sát, kế hoạch hay thực thi; giữ nguyên target .NET 8 đã chọn.
2. Kiểm tra source là VB.NET, loại project, framework và môi trường. Đọc state nếu có và đối chiếu source/tool hashes; vô hiệu kết quả stale.
3. Chọn các bước cần thiết: assess → baseline → plan → convert → runtime/profile port → verify → report. Có thể dùng các skill cùng tên nếu đã cài; nếu thiếu, làm công việc tương ứng theo guide và công cụ sẵn có.
4. Ưu tiên task library có phụ thuộc thấp. Nếu có chu trình hoặc public consumer, nhóm chuyển theo compilation/contract thực tế thay vì đổi file tùy ý.
5. Tách các quyết định UI của Web Forms, contract WCF/ASMX và dependency thương mại khỏi bước đổi cú pháp. Ghi decision trước task phụ thuộc.
6. Khi thiếu baseline/tool/dependency, hoàn tất phần khảo sát có thể làm và báo đúng phần bị chặn. Khi sửa tự động không còn tiến triển, giữ diagnostics/diff và chuyển quyết định cần xử lý.
7. Tổng hợp task, file mapping và test status; không dùng build xanh để bỏ qua workload parity.

## Kiểm tra kết quả

- Mỗi bước hoàn thành có bằng chứng, snapshot và acceptance tương ứng.
- Nguồn thay đổi không được dùng lại trạng thái pass cũ.
- Phạm vi chưa thực hiện hoặc còn VB trong scope được báo là một phần.

## Đọc khi cần

[Hướng dẫn chuyên biệt](references/guide.md) giải thích quyết định, ca biên và giới hạn của bước này. Đọc khi thực hiện phần tương ứng.
