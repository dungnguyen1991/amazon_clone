// IMPORTS FROM PACKAGES
const express = require('express');
const mongoose = require('mongoose');

// IMPORTS FROM OTHER FILES
const authRouter = require('./routes/auth');

//INIT
const PORT = 3000;
const app = express();
const DB = 'mongodb+srv://dungnguyendeveloper1991:y8iXxUXcwhaiL2EP@amazonclonedb.xnuk5jk.mongodb.net/?retryWrites=true&w=majority';

// middleware
// sử dụng dữ liệu là json nếu không sẽ báo lỗi
app.use(express.json());

// thêm dùng này là có thể chạy các lênh bên auth.js
app.use(authRouter);

// connections
mongoose.connect(DB).then(() => {
    console.log('Connection Successful');
}).catch((e) => {
    console.log(e);
});

//creating an api
// get, put, post, delete, update => CRUD

app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected at port ${PORT}`)
});
// chỉ cần bỏ ip là chuyển thành localhost ngay