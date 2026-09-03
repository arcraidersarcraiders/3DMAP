// 本地离线版配置：数据全部来自同站点的 data/ 目录，不依赖任何外部域名。
// 原版为 window.ARC_ORBITER_DATA_BASE = "https://arc-orbiter-data.alex-bowe.workers.dev";
// index.html 会用 `${base}/stella-montis/<场景名>/manifest.json` 拼出 manifest 地址，
// 再以 manifest 所在目录为基准解析 chunks/*.bin.gz，因此这里指向站点根下的 data 目录即可。
window.ARC_ORBITER_DATA_BASE = "../data";
window.STELLA_MONTIS_MANIFEST = "";
