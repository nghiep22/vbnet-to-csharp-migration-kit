# Hợp đồng artifact 0.1

Dữ liệu có schema nằm dưới schemas/. Ví dụ ở examples/contracts/ là synthetic. Thư mục migration của ứng dụng được gitignore mặc định vì có thể chứa source, dữ liệu và config riêng.

~~~text
migration/<run-id>/
  manifest.json
  assessment.json
  assessment/index.md
  assessment/modules/
  evidence.ndjson
  baseline/
  plan.json
  decisions.md
  state.json
  conversion-map.csv
  verification.json
  report.md
~~~

| Artifact | Nội dung tối thiểu |
| --- | --- |
| manifest | Run, target, snapshot, config/platform, tools và validation level |
| assessment | Phạm vi quét, project/workload, unresolved, finding và evidence |
| plan | Source snapshot, strategy, decisions, tasks theo dependency và acceptance |
| state | Trạng thái task, input/output hashes; vô hiệu kết quả stale |
| verification | Baseline snapshot, case, pass/fail/not-run, expected/actual/evidence |
| conversion map | Mọi file/resource trong scope, source/target path, trạng thái và lý do |

Finding có ruleId, severity, claimType, message, file/line evidence, confidence, action và verification. claimType là fact, inference hoặc unknown. Evidence không chứng minh runtime behavior nếu mới đọc code.

Schema kiểm tra cấu trúc; không thể tự xác nhận semantic truth. Reporter không tạo số pass từ thiếu dữ liệu. Sample design-only không được dùng làm baseline. Không nhét token, credential hay connection-string secret vào báo cáo; ghi tên cấu hình và nguồn tham chiếu đã che giá trị.

Helper static inventory tạo một định dạng con riêng experimental; xem script và schema static-inventory. Nó không trả assessment semantic hoàn chỉnh.
