# VB Web Application Migration: hướng dẫn

## Web Forms

ASP.NET Core không chạy Web Forms trực tiếp. Chọn UI dựa trên control library, postback/state, mức interactivity và constraints. Không ép tất cả vào một UI framework. Phục hồi hành vi từng luồng với dữ liệu chuẩn, gồm validation và failure path.

## MVC/Web API

Đối chiếu route matching, attribute routes, filter order, model binding, null/error JSON, date/decimal serialization, HTTP status/content type và exception handling. Public consumer có thể phụ thuộc các chi tiết này.

## Identity và session

Forms/Windows auth, roles/claims, auth cookie, session store, anti-forgery và timeout cần test theo threat/data boundary thực tế. Không coi đăng nhập UI thành công là đã đúng phân quyền. Tiến trình test chạy trên môi trường được phép, không thực thi thao tác production do skill tự suy ra.
