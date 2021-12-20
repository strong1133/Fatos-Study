var crypto = require("crypto");
const main = () => {
    let st = "파일다운로드";
    let nowTime = getTime();
    var passhash = crypto.createHash("md5").update(st).digest("hex");
    var random = Math.random().toString(36).substr(2, 11);
    console.log(random);
};

const getTime = () => {
    const date = new Date();
    let m = date.getMonth() + 1;
    let d = date.getDate().toString();
    let hh = date.getHours().toString();
    let mm = date.getMinutes().toString();
    let ss = date.getSeconds().toString();
    let nowtime = m + d + hh + mm + ss;
    return nowtime;
};

main();
