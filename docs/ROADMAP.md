# Lộ trình từ thiết kế tới bộ công cụ đã kiểm chứng

## 0.1 design — phạm vi repo hiện tại

12 skill, reference, template, schema và ví dụ synthetic; helper static inventory, structure check và project installer. Không có benchmark hay converter/CLI hoàn chỉnh. Ước lượng tạo nội dung lý thuyết không phải cam kết chất lượng runtime.

## M0 — POC

Thử converter/toolchain trên VB Framework và VB SDK-style. Chốt ma trận nguồn/đích và artifact contracts bằng log/output thực tế. Nếu không tương thích, đổi adapter hoặc support matrix trước khi mở rộng.

## M1 — Assessment

Engine inventory/graph/semantic findings, mode static vs semantic, coverage/unresolved và report theo module cho mọi workload. Khảo sát source thật có dẫn chiếu.

## M2 — Language/runtime

Baseline, conversion adapter, source map, task/state, library/console net8 và corpus 40–60 ca ngữ nghĩa dự kiến. Chỉ công bố nhóm thực tế đạt.

## M3 — Desktop/services

WinForms designer/events/resources/binding, Worker/Windows lifecycle và data/interop fixtures. UI/integration không có môi trường phải là not-run.

## M4 — Web/SOAP

MVC/WebAPI/WebForms và WCF/ASMX theo decision cụ thể; có test route/auth/session/postback/contract và data parity.

## M5 — v1 verified

Pilot trên ứng dụng thật, skill eval, đóng gói/CI và install đã thử. Mọi file trong scope được accounting; mọi acceptance case có kết quả/bằng chứng. Phần chưa chuyển vẫn hiển thị. Chỉ khi đó mới định nghĩa bản hỗ trợ thực thi dựa trên fixture đã công bố.

Không suy thời gian thực hiện M0–M5 từ thời gian tạo repo lý thuyết. Cần source và kết quả POC để ước lượng phần engine và migration thực.
