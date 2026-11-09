# VB Migration Workflow: hướng dẫn

## Cách chọn đường đi

VB .NET 8 chỉ cần chuyển ngôn ngữ nếu workload/dependency đã tương thích. Framework có thể convert-ngôn-ngữ trước hoặc runtime-trước theo POC; cả hai cần baseline và mốc đối chiếu. VB6/VBA không nằm trong đường này. Nguồn framework mới hơn 8 là downgrade, cần phân tích API.

## Điều phối

Skill không tự cấp quyền push, deploy, thay DB production hay gửi source ra ngoài. Phạm vi đến từ yêu cầu người dùng. Tránh bắt đầu chuyển mã khi người dùng mới yêu cầu plan. Lệnh vbm trong tài liệu của kit là dự kiến; chỉ gọi executable/MCP thực sự có trong phiên.

Run manifest lưu source snapshot, config, platform, target và tool versions. Task ID ổn định, dependencies và input/output hashes giúp resume. Checkpoint chỉ bao gồm thay đổi của migration, không reset thay đổi người dùng.

## Handoff

Kết thúc một lượt cần ghi: bước đã làm; evidence; remaining diagnostics; quyết định còn thiếu; task kế tiếp; trạng thái build/parity. Bản design-only của skill chưa chứng minh orchestration đã chạy trên ứng dụng thật.
