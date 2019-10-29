// service worker
if (typeof navigator.serviceWorker !== 'undefined') {
    navigator.serviceWorker.register('sw.js')
}

// config
window.$docsify = {
    name: 'flutter学习app文档',
    repo: 'https://github.com/houko/flutter-study-app',
    // logo:'assets/images/avatar.png',
    coverpage: true,
    loadSidebar: true,
    subMaxLevel: 3,
    // copyCode: {
    //     buttonText: 'Copy to clipboard',
    //     errorText: 'Error',
    //     successText: 'Copied'
    // },
    formatUpdated: '{YYYY}-{MM}-{DD}',
    alias: {
        '/.*/_sidebar.md': '/_sidebar.md'
    },
    auto2top: true,
    homepage: 'README.md',
    mergeNavbar: true,
    search: {
        maxAge: 86400000, // 过期时间，单位毫秒，默认一天
        placeholder: '搜索...',
        noData: '找不到结果!'
    },
    plugins: [
        EditOnGithubPlugin.create('https://github.com/flutterjapan/flutter_study_app/blob/master/docs/'),
        function (hook, vm) {
            hook.beforeEach(function (html) {
                return html
                    + '<hr/>'
                    + '上次更新：{docsify-updated} '
            })
        },
        function (hook, vm) {
            hook.mounted(function () {
                var div = Docsify.dom.create('div');
                div.id = 'gitalk-container';
                var main = Docsify.dom.getNode('#main');
                div.style = `width: ${main.clientWidth}px; margin: 0 auto 20px;`;
                Docsify.dom.appendTo(Docsify.dom.find('.content'), div)
            });
            hook.doneEach(function () {
                var el = document.getElementById('gitalk-container');
                while (el.hasChildNodes()) el.removeChild(el.firstChild);
                gitalk.render('gitalk-container')
            })
        }
    ]
};

// git talk
const gitalk = new Gitalk({
    clientID: '4cd0c308ae1050806a2c',
    clientSecret: '42b3c750a3585cb22e05768abc275e9e75ecfca8',
    repo: 'flutter-study-app',
    owner: 'houko',
    admin: ['houko'],
    // title: location.href,
    // facebook-like distraction free mode
    distractionFreeMode: false,
    id: decodeURI(location.pathname),
});
