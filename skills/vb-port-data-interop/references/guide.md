# VB Data and Interop Migration: hướng dẫn

## Kiểm chứng dữ liệu

Fixture cần các ca null/DBNull, midpoint money, date/time/culture, Unicode, concurrent update và permission-filtered rows. Khôi phục sandbox theo cách đã được phép; không dùng reset dữ liệu production làm bước mặc định.

## ORM

Chuyển EF6 sang EF Core làm đổi query/translation/tracking và không phải hệ quả bắt buộc của đổi ngôn ngữ. Đánh giá provider hỗ trợ target và giữ ORM khi khả thi. Thay ORM là task riêng có data parity.

## Ranh giới vendor

Thiếu runtime/license/COM registration hoặc private feed không được thay bằng mock rồi báo dependency chạy được. Mock phục vụ test logic; integration compatibility cần evidence thật.
