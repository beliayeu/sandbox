const proxy = require('express-http-proxy');
const app = require('express')();
const port = 3000
 
app.use('/blog/', proxy('https://www.gatsbyjs.org', {
  proxyReqPathResolver: function (req) {
    console.warn(req.url);
    return '/blog' + req.url;
  },
}))
app.use('/', proxy('https://reactjs.org/'));
app.listen(port, () => console.log(`Example app listening at http://localhost:${port}`))