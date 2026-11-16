# VB Data and Interop Migration: hướng dẫn

## Kiểm chứng dữ liệu

Fixture cần các ca null/DBNull, midpoint money, date/time/culture, Unicode, concurrent update và permission-filtered rows. Khôi phục sandbox theo cách đã được phép; không dùng reset dữ liệu production làm bước mặc định.

## ORM

Chuyển EF6 sang EF Core làm đổi query/translation/tracking và không phải hệ quả bắt buộc của đổi ngôn ngữ. Đánh giá provider hỗ trợ target và giữ ORM khi khả thi. Thay ORM là task riêng có data parity.

## Ranh giới vendor

Thiếu runtime/license/COM registration hoặc private feed không được thay bằng mock rồi báo dependency chạy được. Mock phục vụ test logic; integration compatibility cần evidence thật.

## Tách bốn đường kiểm tra

| Thành phần | Inventory cần có | Bằng chứng chạy cần có |
| --- | --- | --- |
| DB/provider/ORM | Provider/version, connection source, query/procedure, transaction | Parameter và hàng trước/sau, lỗi và rollback |
| Typed DataSet/TableAdapter | XSD, generator, table/column relation, null behavior | Generated type, fill/update, serialization |
| COM/native/ActiveX | GUID/ProgID, typelib, DLL, bitness, registration, apartment | Load/call trên đúng máy và kiến trúc CPU |
| Reporting | Template, runtime/license, parameter, font/image, destination | Nội dung, pagination và output thực tế |

Ghi consumer của mỗi dependency và quyết định giữ/thay/tách. Thiếu SQL procedure, private DLL, vendor runtime hoặc license là giới hạn rõ ràng; không suy tương thích từ tên package hoặc mock.

## Giữ ngữ nghĩa dữ liệu

So parameter name/order/type/size/direction, DBNull với Nothing, decimal scale/rounding, date/timezone, string collation, identity, concurrency token và transaction boundary. Tạo fixture có null, Unicode, biên tiền/ngày, cập nhật đồng thời, quyền lọc hàng và lỗi giữa transaction. Lưu input, trạng thái trước/sau và cách dọn sandbox; không chạm dữ liệu production ngoài phạm vi được giao.

Với SQL động và stored procedure không có source, ghi quan sát/runtime trace hoặc contract được cung cấp, cùng phần unknown. Chuyển EF6 sang EF Core hoặc đổi schema có thể đổi translation/tracking và cần task/acceptance riêng; không gắn vào việc đổi ngôn ngữ mặc định.

## Generated code và interop

Giữ XSD, DataSet designer, resource/proxy generator làm source of truth khi có thể; ghi lệnh và phiên bản dùng để tái sinh. So public type, namespace, table/column name, serialization và nullable behavior sau regenerate. Với COM, kiểm tra registration, x86/x64, marshalling, STA/MTA và deployment trên môi trường giống đích; build C# không chứng minh COM load được.

## Report và kết quả

Đối chiếu report theo dữ liệu, thứ tự, totals, font/image, page break và định dạng xuất; file mở được không chứng minh nội dung đúng. Lưu log, snapshot dữ liệu đã khử nhạy cảm và output mẫu được phép. Ghi pass/fail/not-run riêng cho từng dependency và từng lớp data/interop/reporting, kèm nguyên nhân cụ thể khi không chạy.
