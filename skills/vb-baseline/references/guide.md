# VB Behavioral Baseline: hướng dẫn

## Boundary phù hợp

Library: hàm/public API và serialized result. WinForms: event/UI workflow cùng dữ liệu đầu ra. Web: HTTP/auth/session/cookie và thao tác page. Service: operation/job result, retry và lifecycle. DB: dữ liệu trước/sau trong database test có thể reset an toàn.

## Nondeterminism

Clock, random ID và thứ tự record chỉ được normalize khi plan xác lập chúng không thuộc contract. Không bỏ qua sai khác tiền tệ, quyền dữ liệu, order quan trọng hoặc exception để làm test xanh.

## Baseline lỗi sẵn có

Ghi bug/diagnostic hiện tại; việc sửa bug là decision riêng. Source hash và config thuộc baseline. Tái ghi baseline sau thay đổi source cần phiên bản mới và giải thích.
