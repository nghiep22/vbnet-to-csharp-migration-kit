# Kiến trúc đề xuất

## Trạng thái

Các module engine dưới đây là thiết kế cần triển khai. Bản hiện tại chỉ có skill và helper được liệt kê trong README.

~~~mermaid
flowchart TD
  U[Yêu cầu và phạm vi] --> S[Skill điều phối]
  S --> A[Khảo sát source]
  A --> E[Evidence và artifact có schema]
  E --> P[Plan và task theo phụ thuộc]
  P --> C[Adapter VB sang C#]
  C --> R[Port runtime và workload]
  R --> V[Đối chiếu bản cũ và mới]
  V --> O[Báo cáo và bản publish thử nghiệm]
~~~

## Ranh giới

- Skill chọn bước, đọc bằng chứng và xử lý quyết định. CLI dự kiến làm việc cơ học và trả JSON/exit code.
- Roslyn VB và C# nạp ngữ nghĩa từ compilation thực tế; fallback cú pháp phải công bố reference thiếu.
- MSBuild adapter hỗ trợ configuration, platform, target framework, project references và targeting packs.
- Converter adapter chạy theo phiên bản đã ghim, có thể ngoài process để tách runtime/Roslyn khác phiên bản.
- Profile riêng cho WinForms, MVC/Web API/Web Forms, Windows Service/batch, WCF/ASMX, data/interop.
- Verifier dùng baseline VB độc lập. Reporter render từ JSON, không tự suy ra pass.

## Thiết kế state

Mỗi run lưu ID, source revision hoặc content hash, dirty-tree hash, config/platform, tool versions và task IDs. Task ghi input/output hashes và dependencies. Thay source hoặc tool phải vô hiệu kết quả chịu ảnh hưởng. Apply lặp lại không được tạo thêm subscription, resource hay project reference.

Chuyển theo project/nhóm project phụ thuộc; không yêu cầu solution build ở giữa mỗi file được đổi. Solution VB/C# trung gian chỉ hợp lệ khi TFM và consumer tham chiếu tương thích. Partial migration phải được báo riêng.

## Ngôn ngữ và host

Tài liệu hướng tới người dùng Việt Nam. Skill dùng tên kỹ thuật ổn định. Skill có thể tự dùng bằng đọc file; package host/MCP là adapter tùy chọn. Các command vbm trong tài liệu là đặc tả tương lai.
