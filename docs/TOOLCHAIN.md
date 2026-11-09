# Quản lý toolchain

Không có converter đã được ghim/cài trong bản design-only. File toolchain.example.json là mẫu, không phải lock đã kiểm chứng.

POC phải xác định riêng: source TFM, target TFM, C# language version, runtime chạy tool, Roslyn, MSBuild/Visual Studio build tools, Framework targeting packs, architecture CPU, private feeds và converter mode/version.

CodeConverter là ứng viên đầu tiên. Thử một project VB Framework và một project VB SDK-style với ngữ nghĩa nhạy cảm. Đối chiếu README/changelog hiện hành; không chạy latest rồi mặc định hỗ trợ Framework. CLI và VS extension có thể có ma trận khác. Ghi mọi kết quả cùng version/commit.

Nếu source không resolve reference, không chuyển best-effort thành xác nhận tương đương. Nếu agent không có converter, tạo plan và diagnostics; không mô tả lệnh hoặc MCP không tồn tại như đã thực thi.

Target net8.0/net8.0-windows là cấu hình ứng dụng. Converter chạy trên runtime khác không được tự đổi target. .NET 8 lifecycle ghi theo nguồn Microsoft, giữ target người dùng đã chọn và đưa thay target vào decision riêng.

Thứ tự kiểm tra: môi trường → load project → baseline VB → conversion → build C# trung gian → net8 port → parity. Nếu chọn đường khác do dependency, ghi lý do. Không tự đổi EF, giao thức hay UI để đạt build.
