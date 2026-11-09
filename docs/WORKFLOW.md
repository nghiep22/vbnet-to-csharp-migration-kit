# Quy trình migration đề xuất

1. **Intake:** xác định VB.NET, source framework/workload, target 8, config/platform, môi trường build, dữ liệu kiểm thử và scope.
2. **Assess:** kiểm kê project/file/resource, reference, entry point, UI/API/job, data access và semantic risks. Ghi fact/inference/unknown.
3. **Baseline:** build/chạy bản VB trong môi trường phù hợp; ghi lỗi có sẵn và output/side effect của luồng quan trọng.
4. **Plan:** chọn thứ tự theo graph, nhóm phụ thuộc cần chuyển cùng, converter/toolchain và tiêu chí acceptance.
5. **Convert:** ưu tiên tách đổi ngôn ngữ và đổi runtime khi khả thi. Dùng converter phù hợp; giữ mapping; xử lý diagnostics có kiểm chứng.
6. **Port:** runtime/project/packages và profile workload. Quyết định UI/contract lớn phải có trong plan trước task phụ thuộc.
7. **Verify:** build/publish, semantic parity, data/contract/UI/lifecycle theo baseline.
8. **Report:** đối soát file và task; giữ fail/not-run và giới hạn, tạo handoff cho phần còn lại.

## Đường chuyển

- VB .NET 8: chuyển ngôn ngữ, không đổi TFM vô cớ.
- Framework build được: ưu tiên conversion cùng runtime rồi port khi toolchain cho phép; kiểm tra ở giữa.
- Dependency/converter đòi runtime-first: cho phép nâng VB runtime rồi chuyển C#, ghi decision.
- Chưa build được: vẫn tạo assessment, phục hồi baseline; không tuyên bố parity.

Mỗi mốc kiểm chứng có evidence riêng: assessment coverage, baseline, plan decisions, conversion, net8 build, workload parity, publish smoke. Có lỗi ở mốc bắt buộc thì task sau phụ thuộc không được coi hoàn tất. Khi vòng sửa không giảm vấn đề theo retry budget, để lại diff/diagnostics và quyết định cần người dùng.

Migration không tự bao gồm deploy production, thay schema DB, bỏ test, đổi public contract hoặc tái thiết kế UI không nằm trong scope. User authorization từ phiên làm việc quyết định thao tác nào được thực hiện; skill không tự cấp quyền.
