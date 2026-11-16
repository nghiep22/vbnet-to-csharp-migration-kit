# VB Web Application Migration: hướng dẫn

## Web Forms

ASP.NET Core không chạy Web Forms trực tiếp. Chọn UI dựa trên control library, postback/state, mức interactivity và constraints. Không ép tất cả vào một UI framework. Phục hồi hành vi từng luồng với dữ liệu chuẩn, gồm validation và failure path.

## MVC/Web API

Đối chiếu route matching, attribute routes, filter order, model binding, null/error JSON, date/decimal serialization, HTTP status/content type và exception handling. Public consumer có thể phụ thuộc các chi tiết này.

## Identity và session

Forms/Windows auth, roles/claims, auth cookie, session store, anti-forgery và timeout cần test theo threat/data boundary thực tế. Không coi đăng nhập UI thành công là đã đúng phân quyền. Tiến trình test chạy trên môi trường được phép, không thực thi thao tác production do skill tự suy ra.

## Chốt subtype và contract quan sát được

Xác định host và kiểu app từ project/config/source: MVC 5, Web API 2, Web Forms, Web Site hoặc hỗn hợp. Liệt kê route order, default route, handler/module, global filter, content negotiation, auth middleware, session store và static/upload/download paths. Với consumer bên ngoài, lưu request/response đã che dữ liệu nhạy cảm thay vì chỉ mô tả endpoint.

| Mặt hợp đồng | Case tham chiếu cần có |
| --- | --- |
| Route và binding | URL, method, query/form/body, route precedence, validation lỗi |
| Response | Status, header, content type, JSON/XML shape, null/date/decimal |
| Identity | Cookie, redirect, timeout, role/claim, tài nguyên được phép và bị từ chối |
| Session | Hai người dùng song song, hết hạn, restart và state cần giữ |
| Side effect | DB/file/message trước và sau request, transaction lỗi |

## Web Forms là quyết định UI

Lập bản đồ page/control/code-behind, user control, ViewState/control state, postback event, validation group, master page và session. Chọn Razor Pages, MVC hoặc Blazor theo interaction, component phụ thuộc và constraint đã xác nhận; ghi mapping từng luồng, kể cả failure path. Không thay markup bằng trang placeholder rồi coi là chuyển xong.

Nếu dùng coexistence/proxy, ghi route do app cũ và app mới sở hữu, cách chuyển cookie/session/identity và điều kiện gỡ phần cũ. Compatibility adapter cần POC trên đúng target và feature dùng; không suy mọi System.Web API có mặt.

## Đối chiếu chạy thật

Chạy HTTP contract cases bằng cùng input/culture và test UI cho luồng có state. Kiểm tra unauthorized/forbidden, quyền trên dữ liệu, CSRF nếu liên quan, redirect, upload limit, lỗi serialization, concurrency và tác động DB. Chỉ ghi pass cho phần đã chạy; browser happy path không chứng minh route và authorization đầy đủ.
