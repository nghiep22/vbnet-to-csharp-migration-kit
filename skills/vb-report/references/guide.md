# VB Migration Reporting: hướng dẫn

## Báo cáo khảo sát

Tổng quan → phạm vi/coverage → architecture/function/data/integration maps → semantic risks → missing evidence → phương án và task. Độ tin cậy gắn với nguồn: file/line/symbol hoặc runtime evidence.

## Báo cáo thực thi

Ghi before/after snapshot, command/toolchain, changes/mapping, acceptance results và phần còn lại. Build và parity được trình bày riêng. Nội dung phục vụ maintainer; không thêm banner migration vào giao diện sản phẩm.

## Trạng thái hoàn thành

Theo đúng scope và acceptance của plan. Nếu chỉ hoàn thành assessment, gọi là assessment complete. Nếu ứng dụng chưa đạt target hoặc còn phần chưa chuyển, ghi partial/blocked tương ứng. Quyết định người dùng chấp nhận deferred scope cần hiện rõ và không được suy ra từ im lặng.

## Kiểm tra đầu vào trước khi tổng hợp

Đối chiếu run ID, source/target snapshot, config/platform, tool version và origin của assessment/plan/state/verification. Artifact stale hoặc synthetic không được tính vào kết quả ứng dụng. Schema pass chỉ xác nhận cấu trúc; kiểm tra evidence path có tồn tại và có liên hệ đúng case.

## Tính phạm vi hoàn thành

Đặt mẫu số là file/resource/task trong scope đã chốt, rồi chia converted, retained, pending và excluded có lý do. Tách source VB còn compile trong scope, generated VB còn cần tái sinh và VB ngoài scope. Task completed chỉ khi acceptance có evidence; task blocked/pending và decision open xuất hiện trong summary.

| Khẳng định | Nguồn tối thiểu |
| --- | --- |
| Đã khảo sát | Inventory, coverage, unresolved và source snapshot |
| Đã chuyển mã | Diff, conversion map và project/task scope |
| Build/publish đạt | Command, config/RID, exit code và log |
| Hành vi tương đương | Case VB/contract độc lập, actual C# và diff/evidence |
| Workload hoàn tất | Acceptance UI/web/service/data cần thiết đều có kết quả |

Không tính not-run vào pass rate. Khi chỉ có static assessment, báo khảo sát tĩnh; khi build xanh nhưng parity chưa chạy, báo build đạt và parity chưa kiểm chứng. Không dùng phần trăm migration hoặc automation nếu mẫu số, cách đo và nguồn không rõ.

## Handoff dùng được

Báo cáo ngắn đầu tiên nêu scope, mốc đã đạt, fail/not-run, blocker và quyết định cần chốt. Phần chi tiết ghi task/file mapping, command tái chạy, môi trường, package/toolchain, risk còn lại và bước tiếp theo theo dependency. Với thay đổi code, chỉ ra rollback boundary của phần migration và trạng thái source hiện tại; không đưa secret, source riêng hoặc dữ liệu nhạy cảm vào báo cáo công khai.
