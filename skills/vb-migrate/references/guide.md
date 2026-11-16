# VB Migration Workflow: hướng dẫn

## Cách chọn đường đi

VB .NET 8 chỉ cần chuyển ngôn ngữ nếu workload/dependency đã tương thích. Framework có thể convert-ngôn-ngữ trước hoặc runtime-trước theo POC; cả hai cần baseline và mốc đối chiếu. VB6/VBA không nằm trong đường này. Nguồn framework mới hơn 8 là downgrade, cần phân tích API.

## Điều phối

Skill không tự cấp quyền push, deploy, thay DB production hay gửi source ra ngoài. Phạm vi đến từ yêu cầu người dùng. Tránh bắt đầu chuyển mã khi người dùng mới yêu cầu plan. Lệnh vbm trong tài liệu của kit là dự kiến; chỉ gọi executable/MCP thực sự có trong phiên.

Run manifest lưu source snapshot, config, platform, target và tool versions. Task ID ổn định, dependencies và input/output hashes giúp resume. Checkpoint chỉ bao gồm thay đổi của migration, không reset thay đổi người dùng.

## Handoff

Kết thúc một lượt cần ghi: bước đã làm; evidence; remaining diagnostics; quyết định còn thiếu; task kế tiếp; trạng thái build/parity. Bản design-only của skill chưa chứng minh orchestration đã chạy trên ứng dụng thật.

## Chọn bước theo yêu cầu

| Yêu cầu hiện tại | Hành động hợp phạm vi | Kết quả phải nói rõ |
| --- | --- | --- |
| Khảo sát | Inventory và finding có nguồn | Chưa chuyển source, mode static/semantic |
| Chỉ lập kế hoạch | Đối soát assessment, baseline và quyết định | Task/dependency, acceptance, blocker |
| Thực hiện migration | Đi theo task và các mốc kiểm chứng đã chọn | Diff, mapping, build và parity riêng |
| Tiếp tục run | So snapshot/tool/config và state | Task nào còn hợp lệ, task nào stale |

Với yêu cầu thực thi rộng, bắt đầu bằng phạm vi, snapshot và bằng chứng hiện có; không cần giả định rằng mọi bước đều phải làm lại. Nếu người dùng đã chọn target hoặc workload, giữ lựa chọn đó và ghi rủi ro. Không dùng một skill chuyên biệt để tự mở rộng sang workload khác.

## Resume và vô hiệu kết quả cũ

So source revision và dirty-tree hash, config/platform, target, converter version, dependency/toolchain và input hash của task. Khi một đầu vào đổi, đánh dấu task trực tiếp và task phụ thuộc là cần kiểm tra lại; giữ artifact cũ để truy vết thay vì ghi đè thành pass mới. Không reset thay đổi người dùng để phục hồi state.

Nếu task đã apply một phần, đối chiếu diff thực tế với conversion map và output hash trước khi chạy lại. Chỉ lặp thao tác có tính idempotent đã kiểm tra; đặc biệt kiểm tra project reference, event subscription, resource và generated file để tránh nhân đôi.

## Cổng giữa các giai đoạn

Assessment cần nêu unresolved trước plan. Baseline VB cần độc lập trước khi khẳng định parity. Conversion cần mapping và diagnostics trước runtime/profile port. Build C# và publish chỉ chứng minh lớp kỹ thuật tương ứng; verify phải đối chiếu hành vi theo workload. Có thể tiếp tục task độc lập khi một nhánh bị chặn, nhưng report phải giữ dependency và phạm vi chưa hoàn tất.

Khi tool hay môi trường vắng mặt, ghi command đã thử và phần thực sự làm được. CLI vbm trong tài liệu là đặc tả tương lai; chỉ dùng executable có thật. Mỗi lượt kết thúc bằng trạng thái task, artifact mới, kết quả chạy, blocker có chủ sở hữu và bước kế tiếp có thể thực hiện.
