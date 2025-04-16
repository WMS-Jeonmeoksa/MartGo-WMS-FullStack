const http = require('http');
const fs = require('fs');
const path = require('path');

const PORT = 3000;

const server = http.createServer((req, res) => {
    const fileName = req.url === '/' ? 'index.html' : req.url;
    const filePath = path.join(__dirname, 'src/main/resources/static', fileName);  // 항상 static 폴더 기준
    const ext = path.extname(filePath);
    let contentType = 'text/html';
    switch (ext) {
        case '.css':
            contentType = 'text/css';
            break;
        case '.js':
        case '.cjs':
            contentType = 'application/javascript';
            break;
        case '.png':
        case '.jpg':
        case '.jpeg':
        case '.gif':
            contentType = 'image/' + ext.slice(1);
            break;
    }

    fs.readFile(filePath, ext === '.html' ? 'utf8' : null, (err, data) => {
        if (err) {
            console.log('❌ 파일 못 찾음:', filePath);
            res.writeHead(404);
            res.end('파일을 찾을 수 없습니다');
        } else {
            res.writeHead(200, { 'Content-Type': contentType + '; charset=UTF-8' });
            res.end(data);
        }
    });
});

server.listen(PORT, () => {
    console.log(`✅ 서버가 http://localhost:${PORT} 에서 실행 중입니다`);
});
