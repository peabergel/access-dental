var e={316:(e,t,n)=>{function o(e){if(null==e)return window;if("[object Window]"!==e.toString()){var t=e.ownerDocument;return t&&t.defaultView||window}return e}function i(e){return e instanceof o(e).Element||e instanceof Element}function r(e){return e instanceof o(e).HTMLElement||e instanceof HTMLElement}function s(e){return"undefined"!=typeof ShadowRoot&&(e instanceof o(e).ShadowRoot||e instanceof ShadowRoot)}n.d(t,{n4:()=>ve});var a=Math.max,c=Math.min,f=Math.round;function l(){var e=navigator.userAgentData;return null!=e&&e.brands&&Array.isArray(e.brands)?e.brands.map((function(e){return e.brand+"/"+e.version})).join(" "):navigator.userAgent}function p(){return!/^((?!chrome|android).)*safari/i.test(l())}function d(e,t,n){void 0===t&&(t=!1),void 0===n&&(n=!1);var s=e.getBoundingClientRect(),a=1,c=1;t&&r(e)&&(a=e.offsetWidth>0&&f(s.width)/e.offsetWidth||1,c=e.offsetHeight>0&&f(s.height)/e.offsetHeight||1);var l=(i(e)?o(e):window).visualViewport,d=!p()&&n,u=(s.left+(d&&l?l.offsetLeft:0))/a,h=(s.top+(d&&l?l.offsetTop:0))/c,m=s.width/a,v=s.height/c;return{width:m,height:v,top:h,right:u+m,bottom:h+v,left:u,x:u,y:h}}function u(e){var t=o(e);return{scrollLeft:t.pageXOffset,scrollTop:t.pageYOffset}}function h(e){return e?(e.nodeName||"").toLowerCase():null}function m(e){return((i(e)?e.ownerDocument:e.document)||window.document).documentElement}function v(e){return d(m(e)).left+u(e).scrollLeft}function g(e){return o(e).getComputedStyle(e)}function y(e){var t=g(e),n=t.overflow,o=t.overflowX,i=t.overflowY;return/auto|scroll|overlay|hidden/.test(n+i+o)}function b(e,t,n){void 0===n&&(n=!1);var i,s,a=r(t),c=r(t)&&function(e){var t=e.getBoundingClientRect(),n=f(t.width)/e.offsetWidth||1,o=f(t.height)/e.offsetHeight||1;return 1!==n||1!==o}(t),l=m(t),p=d(e,c,n),g={scrollLeft:0,scrollTop:0},b={x:0,y:0};return(a||!a&&!n)&&(("body"!==h(t)||y(l))&&(g=(i=t)!==o(i)&&r(i)?{scrollLeft:(s=i).scrollLeft,scrollTop:s.scrollTop}:u(i)),r(t)?((b=d(t,!0)).x+=t.clientLeft,b.y+=t.clientTop):l&&(b.x=v(l))),{x:p.left+g.scrollLeft-b.x,y:p.top+g.scrollTop-b.y,width:p.width,height:p.height}}function w(e){var t=d(e),n=e.offsetWidth,o=e.offsetHeight;return Math.abs(t.width-n)<=1&&(n=t.width),Math.abs(t.height-o)<=1&&(o=t.height),{x:e.offsetLeft,y:e.offsetTop,width:n,height:o}}function x(e){return"html"===h(e)?e:e.assignedSlot||e.parentNode||(s(e)?e.host:null)||m(e)}function O(e){return["html","body","#document"].indexOf(h(e))>=0?e.ownerDocument.body:r(e)&&y(e)?e:O(x(e))}function E(e,t){var n;void 0===t&&(t=[]);var i=O(e),r=i===(null==(n=e.ownerDocument)?void 0:n.body),s=o(i),a=r?[s].concat(s.visualViewport||[],y(i)?i:[]):i,c=t.concat(a);return r?c:c.concat(E(x(a)))}function j(e){return["table","td","th"].indexOf(h(e))>=0}function L(e){return r(e)&&"fixed"!==g(e).position?e.offsetParent:null}function A(e){for(var t=o(e),n=L(e);n&&j(n)&&"static"===g(n).position;)n=L(n);return n&&("html"===h(n)||"body"===h(n)&&"static"===g(n).position)?t:n||function(e){var t=/firefox/i.test(l());if(/Trident/i.test(l())&&r(e)&&"fixed"===g(e).position)return null;var n=x(e);for(s(n)&&(n=n.host);r(n)&&["html","body"].indexOf(h(n))<0;){var o=g(n);if("none"!==o.transform||"none"!==o.perspective||"paint"===o.contain||-1!==["transform","perspective"].indexOf(o.willChange)||t&&"filter"===o.willChange||t&&o.filter&&"none"!==o.filter)return n;n=n.parentNode}return null}(e)||t}var D="top",P="bottom",k="right",T="left",M="auto",C=[D,P,k,T],S="start",W="end",H="clippingParents",q="viewport",B="popper",R="reference",V=C.reduce((function(e,t){return e.concat([t+"-"+S,t+"-"+W])}),[]),I=[].concat(C,[M]).reduce((function(e,t){return e.concat([t,t+"-"+S,t+"-"+W])}),[]),$=["beforeRead","read","afterRead","beforeMain","main","afterMain","beforeWrite","write","afterWrite"];function N(e){var t=new Map,n=new Set,o=[];function i(e){n.add(e.name),[].concat(e.requires||[],e.requiresIfExists||[]).forEach((function(e){if(!n.has(e)){var o=t.get(e);o&&i(o)}})),o.push(e)}return e.forEach((function(e){t.set(e.name,e)})),e.forEach((function(e){n.has(e.name)||i(e)})),o}var F={placement:"bottom",modifiers:[],strategy:"absolute"};function U(){for(var e=arguments.length,t=new Array(e),n=0;n<e;n++)t[n]=arguments[n];return!t.some((function(e){return!(e&&"function"==typeof e.getBoundingClientRect)}))}function z(e){void 0===e&&(e={});var t=e,n=t.defaultModifiers,o=void 0===n?[]:n,r=t.defaultOptions,s=void 0===r?F:r;return function(e,t,n){void 0===n&&(n=s);var r,a,c={placement:"bottom",orderedModifiers:[],options:Object.assign({},F,s),modifiersData:{},elements:{reference:e,popper:t},attributes:{},styles:{}},f=[],l=!1,p={state:c,setOptions:function(n){var r="function"==typeof n?n(c.options):n;d(),c.options=Object.assign({},s,c.options,r),c.scrollParents={reference:i(e)?E(e):e.contextElement?E(e.contextElement):[],popper:E(t)};var a,l,u=function(e){var t=N(e);return $.reduce((function(e,n){return e.concat(t.filter((function(e){return e.phase===n})))}),[])}((a=[].concat(o,c.options.modifiers),l=a.reduce((function(e,t){var n=e[t.name];return e[t.name]=n?Object.assign({},n,t,{options:Object.assign({},n.options,t.options),data:Object.assign({},n.data,t.data)}):t,e}),{}),Object.keys(l).map((function(e){return l[e]}))));return c.orderedModifiers=u.filter((function(e){return e.enabled})),c.orderedModifiers.forEach((function(e){var t=e.name,n=e.options,o=void 0===n?{}:n,i=e.effect;if("function"==typeof i){var r=i({state:c,name:t,instance:p,options:o}),s=function(){};f.push(r||s)}})),p.update()},forceUpdate:function(){if(!l){var e=c.elements,t=e.reference,n=e.popper;if(U(t,n)){c.rects={reference:b(t,A(n),"fixed"===c.options.strategy),popper:w(n)},c.reset=!1,c.placement=c.options.placement,c.orderedModifiers.forEach((function(e){return c.modifiersData[e.name]=Object.assign({},e.data)}));for(var o=0;o<c.orderedModifiers.length;o++)if(!0!==c.reset){var i=c.orderedModifiers[o],r=i.fn,s=i.options,a=void 0===s?{}:s,f=i.name;"function"==typeof r&&(c=r({state:c,options:a,name:f,instance:p})||c)}else c.reset=!1,o=-1}}},update:(r=function(){return new Promise((function(e){p.forceUpdate(),e(c)}))},function(){return a||(a=new Promise((function(e){Promise.resolve().then((function(){a=void 0,e(r())}))}))),a}),destroy:function(){d(),l=!0}};if(!U(e,t))return p;function d(){f.forEach((function(e){return e()})),f=[]}return p.setOptions(n).then((function(e){!l&&n.onFirstUpdate&&n.onFirstUpdate(e)})),p}}var J={passive:!0};function _(e){return e.split("-")[0]}function X(e){return e.split("-")[1]}function Y(e){return["top","bottom"].indexOf(e)>=0?"x":"y"}function G(e){var t,n=e.reference,o=e.element,i=e.placement,r=i?_(i):null,s=i?X(i):null,a=n.x+n.width/2-o.width/2,c=n.y+n.height/2-o.height/2;switch(r){case D:t={x:a,y:n.y-o.height};break;case P:t={x:a,y:n.y+n.height};break;case k:t={x:n.x+n.width,y:c};break;case T:t={x:n.x-o.width,y:c};break;default:t={x:n.x,y:n.y}}var f=r?Y(r):null;if(null!=f){var l="y"===f?"height":"width";switch(s){case S:t[f]=t[f]-(n[l]/2-o[l]/2);break;case W:t[f]=t[f]+(n[l]/2-o[l]/2)}}return t}var K={top:"auto",right:"auto",bottom:"auto",left:"auto"};function Q(e){var t,n=e.popper,i=e.popperRect,r=e.placement,s=e.variation,a=e.offsets,c=e.position,l=e.gpuAcceleration,p=e.adaptive,d=e.roundOffsets,u=e.isFixed,h=a.x,v=void 0===h?0:h,y=a.y,b=void 0===y?0:y,w="function"==typeof d?d({x:v,y:b}):{x:v,y:b};v=w.x,b=w.y;var x=a.hasOwnProperty("x"),O=a.hasOwnProperty("y"),E=T,j=D,L=window;if(p){var M=A(n),C="clientHeight",S="clientWidth";if(M===o(n)&&"static"!==g(M=m(n)).position&&"absolute"===c&&(C="scrollHeight",S="scrollWidth"),r===D||(r===T||r===k)&&s===W)j=P,b-=(u&&M===L&&L.visualViewport?L.visualViewport.height:M[C])-i.height,b*=l?1:-1;if(r===T||(r===D||r===P)&&s===W)E=k,v-=(u&&M===L&&L.visualViewport?L.visualViewport.width:M[S])-i.width,v*=l?1:-1}var H,q=Object.assign({position:c},p&&K),B=!0===d?function(e,t){var n=e.x,o=e.y,i=t.devicePixelRatio||1;return{x:f(n*i)/i||0,y:f(o*i)/i||0}}({x:v,y:b},o(n)):{x:v,y:b};return v=B.x,b=B.y,l?Object.assign({},q,((H={})[j]=O?"0":"",H[E]=x?"0":"",H.transform=(L.devicePixelRatio||1)<=1?"translate("+v+"px, "+b+"px)":"translate3d("+v+"px, "+b+"px, 0)",H)):Object.assign({},q,((t={})[j]=O?b+"px":"",t[E]=x?v+"px":"",t.transform="",t))}const Z={name:"offset",enabled:!0,phase:"main",requires:["popperOffsets"],fn:function(e){var t=e.state,n=e.options,o=e.name,i=n.offset,r=void 0===i?[0,0]:i,s=I.reduce((function(e,n){return e[n]=function(e,t,n){var o=_(e),i=[T,D].indexOf(o)>=0?-1:1,r="function"==typeof n?n(Object.assign({},t,{placement:e})):n,s=r[0],a=r[1];return s=s||0,a=(a||0)*i,[T,k].indexOf(o)>=0?{x:a,y:s}:{x:s,y:a}}(n,t.rects,r),e}),{}),a=s[t.placement],c=a.x,f=a.y;null!=t.modifiersData.popperOffsets&&(t.modifiersData.popperOffsets.x+=c,t.modifiersData.popperOffsets.y+=f),t.modifiersData[o]=s}};var ee={left:"right",right:"left",bottom:"top",top:"bottom"};function te(e){return e.replace(/left|right|bottom|top/g,(function(e){return ee[e]}))}var ne={start:"end",end:"start"};function oe(e){return e.replace(/start|end/g,(function(e){return ne[e]}))}function ie(e,t){var n=t.getRootNode&&t.getRootNode();if(e.contains(t))return!0;if(n&&s(n)){var o=t;do{if(o&&e.isSameNode(o))return!0;o=o.parentNode||o.host}while(o)}return!1}function re(e){return Object.assign({},e,{left:e.x,top:e.y,right:e.x+e.width,bottom:e.y+e.height})}function se(e,t,n){return t===q?re(function(e,t){var n=o(e),i=m(e),r=n.visualViewport,s=i.clientWidth,a=i.clientHeight,c=0,f=0;if(r){s=r.width,a=r.height;var l=p();(l||!l&&"fixed"===t)&&(c=r.offsetLeft,f=r.offsetTop)}return{width:s,height:a,x:c+v(e),y:f}}(e,n)):i(t)?function(e,t){var n=d(e,!1,"fixed"===t);return n.top=n.top+e.clientTop,n.left=n.left+e.clientLeft,n.bottom=n.top+e.clientHeight,n.right=n.left+e.clientWidth,n.width=e.clientWidth,n.height=e.clientHeight,n.x=n.left,n.y=n.top,n}(t,n):re(function(e){var t,n=m(e),o=u(e),i=null==(t=e.ownerDocument)?void 0:t.body,r=a(n.scrollWidth,n.clientWidth,i?i.scrollWidth:0,i?i.clientWidth:0),s=a(n.scrollHeight,n.clientHeight,i?i.scrollHeight:0,i?i.clientHeight:0),c=-o.scrollLeft+v(e),f=-o.scrollTop;return"rtl"===g(i||n).direction&&(c+=a(n.clientWidth,i?i.clientWidth:0)-r),{width:r,height:s,x:c,y:f}}(m(e)))}function ae(e,t,n,o){var s="clippingParents"===t?function(e){var t=E(x(e)),n=["absolute","fixed"].indexOf(g(e).position)>=0&&r(e)?A(e):e;return i(n)?t.filter((function(e){return i(e)&&ie(e,n)&&"body"!==h(e)})):[]}(e):[].concat(t),f=[].concat(s,[n]),l=f[0],p=f.reduce((function(t,n){var i=se(e,n,o);return t.top=a(i.top,t.top),t.right=c(i.right,t.right),t.bottom=c(i.bottom,t.bottom),t.left=a(i.left,t.left),t}),se(e,l,o));return p.width=p.right-p.left,p.height=p.bottom-p.top,p.x=p.left,p.y=p.top,p}function ce(e){return Object.assign({},{top:0,right:0,bottom:0,left:0},e)}function fe(e,t){return t.reduce((function(t,n){return t[n]=e,t}),{})}function le(e,t){void 0===t&&(t={});var n=t,o=n.placement,r=void 0===o?e.placement:o,s=n.strategy,a=void 0===s?e.strategy:s,c=n.boundary,f=void 0===c?H:c,l=n.rootBoundary,p=void 0===l?q:l,u=n.elementContext,h=void 0===u?B:u,v=n.altBoundary,g=void 0!==v&&v,y=n.padding,b=void 0===y?0:y,w=ce("number"!=typeof b?b:fe(b,C)),x=h===B?R:B,O=e.rects.popper,E=e.elements[g?x:h],j=ae(i(E)?E:E.contextElement||m(e.elements.popper),f,p,a),L=d(e.elements.reference),A=G({reference:L,element:O,strategy:"absolute",placement:r}),T=re(Object.assign({},O,A)),M=h===B?T:L,S={top:j.top-M.top+w.top,bottom:M.bottom-j.bottom+w.bottom,left:j.left-M.left+w.left,right:M.right-j.right+w.right},W=e.modifiersData.offset;if(h===B&&W){var V=W[r];Object.keys(S).forEach((function(e){var t=[k,P].indexOf(e)>=0?1:-1,n=[D,P].indexOf(e)>=0?"y":"x";S[e]+=V[n]*t}))}return S}function pe(e,t,n){return a(e,c(t,n))}const de={name:"preventOverflow",enabled:!0,phase:"main",fn:function(e){var t=e.state,n=e.options,o=e.name,i=n.mainAxis,r=void 0===i||i,s=n.altAxis,f=void 0!==s&&s,l=n.boundary,p=n.rootBoundary,d=n.altBoundary,u=n.padding,h=n.tether,m=void 0===h||h,v=n.tetherOffset,g=void 0===v?0:v,y=le(t,{boundary:l,rootBoundary:p,padding:u,altBoundary:d}),b=_(t.placement),x=X(t.placement),O=!x,E=Y(b),j="x"===E?"y":"x",L=t.modifiersData.popperOffsets,M=t.rects.reference,C=t.rects.popper,W="function"==typeof g?g(Object.assign({},t.rects,{placement:t.placement})):g,H="number"==typeof W?{mainAxis:W,altAxis:W}:Object.assign({mainAxis:0,altAxis:0},W),q=t.modifiersData.offset?t.modifiersData.offset[t.placement]:null,B={x:0,y:0};if(L){if(r){var R,V="y"===E?D:T,I="y"===E?P:k,$="y"===E?"height":"width",N=L[E],F=N+y[V],U=N-y[I],z=m?-C[$]/2:0,J=x===S?M[$]:C[$],G=x===S?-C[$]:-M[$],K=t.elements.arrow,Q=m&&K?w(K):{width:0,height:0},Z=t.modifiersData["arrow#persistent"]?t.modifiersData["arrow#persistent"].padding:{top:0,right:0,bottom:0,left:0},ee=Z[V],te=Z[I],ne=pe(0,M[$],Q[$]),oe=O?M[$]/2-z-ne-ee-H.mainAxis:J-ne-ee-H.mainAxis,ie=O?-M[$]/2+z+ne+te+H.mainAxis:G+ne+te+H.mainAxis,re=t.elements.arrow&&A(t.elements.arrow),se=re?"y"===E?re.clientTop||0:re.clientLeft||0:0,ae=null!=(R=null==q?void 0:q[E])?R:0,ce=N+ie-ae,fe=pe(m?c(F,N+oe-ae-se):F,N,m?a(U,ce):U);L[E]=fe,B[E]=fe-N}if(f){var de,ue="x"===E?D:T,he="x"===E?P:k,me=L[j],ve="y"===j?"height":"width",ge=me+y[ue],ye=me-y[he],be=-1!==[D,T].indexOf(b),we=null!=(de=null==q?void 0:q[j])?de:0,xe=be?ge:me-M[ve]-C[ve]-we+H.altAxis,Oe=be?me+M[ve]+C[ve]-we-H.altAxis:ye,Ee=m&&be?function(e,t,n){var o=pe(e,t,n);return o>n?n:o}(xe,me,Oe):pe(m?xe:ge,me,m?Oe:ye);L[j]=Ee,B[j]=Ee-me}t.modifiersData[o]=B}},requiresIfExists:["offset"]};const ue={name:"arrow",enabled:!0,phase:"main",fn:function(e){var t,n=e.state,o=e.name,i=e.options,r=n.elements.arrow,s=n.modifiersData.popperOffsets,a=_(n.placement),c=Y(a),f=[T,k].indexOf(a)>=0?"height":"width";if(r&&s){var l=function(e,t){return ce("number"!=typeof(e="function"==typeof e?e(Object.assign({},t.rects,{placement:t.placement})):e)?e:fe(e,C))}(i.padding,n),p=w(r),d="y"===c?D:T,u="y"===c?P:k,h=n.rects.reference[f]+n.rects.reference[c]-s[c]-n.rects.popper[f],m=s[c]-n.rects.reference[c],v=A(r),g=v?"y"===c?v.clientHeight||0:v.clientWidth||0:0,y=h/2-m/2,b=l[d],x=g-p[f]-l[u],O=g/2-p[f]/2+y,E=pe(b,O,x),j=c;n.modifiersData[o]=((t={})[j]=E,t.centerOffset=E-O,t)}},effect:function(e){var t=e.state,n=e.options.element,o=void 0===n?"[data-popper-arrow]":n;null!=o&&("string"!=typeof o||(o=t.elements.popper.querySelector(o)))&&ie(t.elements.popper,o)&&(t.elements.arrow=o)},requires:["popperOffsets"],requiresIfExists:["preventOverflow"]};function he(e,t,n){return void 0===n&&(n={x:0,y:0}),{top:e.top-t.height-n.y,right:e.right-t.width+n.x,bottom:e.bottom-t.height+n.y,left:e.left-t.width-n.x}}function me(e){return[D,k,P,T].some((function(t){return e[t]>=0}))}var ve=z({defaultModifiers:[{name:"eventListeners",enabled:!0,phase:"write",fn:function(){},effect:function(e){var t=e.state,n=e.instance,i=e.options,r=i.scroll,s=void 0===r||r,a=i.resize,c=void 0===a||a,f=o(t.elements.popper),l=[].concat(t.scrollParents.reference,t.scrollParents.popper);return s&&l.forEach((function(e){e.addEventListener("scroll",n.update,J)})),c&&f.addEventListener("resize",n.update,J),function(){s&&l.forEach((function(e){e.removeEventListener("scroll",n.update,J)})),c&&f.removeEventListener("resize",n.update,J)}},data:{}},{name:"popperOffsets",enabled:!0,phase:"read",fn:function(e){var t=e.state,n=e.name;t.modifiersData[n]=G({reference:t.rects.reference,element:t.rects.popper,strategy:"absolute",placement:t.placement})},data:{}},{name:"computeStyles",enabled:!0,phase:"beforeWrite",fn:function(e){var t=e.state,n=e.options,o=n.gpuAcceleration,i=void 0===o||o,r=n.adaptive,s=void 0===r||r,a=n.roundOffsets,c=void 0===a||a,f={placement:_(t.placement),variation:X(t.placement),popper:t.elements.popper,popperRect:t.rects.popper,gpuAcceleration:i,isFixed:"fixed"===t.options.strategy};null!=t.modifiersData.popperOffsets&&(t.styles.popper=Object.assign({},t.styles.popper,Q(Object.assign({},f,{offsets:t.modifiersData.popperOffsets,position:t.options.strategy,adaptive:s,roundOffsets:c})))),null!=t.modifiersData.arrow&&(t.styles.arrow=Object.assign({},t.styles.arrow,Q(Object.assign({},f,{offsets:t.modifiersData.arrow,position:"absolute",adaptive:!1,roundOffsets:c})))),t.attributes.popper=Object.assign({},t.attributes.popper,{"data-popper-placement":t.placement})},data:{}},{name:"applyStyles",enabled:!0,phase:"write",fn:function(e){var t=e.state;Object.keys(t.elements).forEach((function(e){var n=t.styles[e]||{},o=t.attributes[e]||{},i=t.elements[e];r(i)&&h(i)&&(Object.assign(i.style,n),Object.keys(o).forEach((function(e){var t=o[e];!1===t?i.removeAttribute(e):i.setAttribute(e,!0===t?"":t)})))}))},effect:function(e){var t=e.state,n={popper:{position:t.options.strategy,left:"0",top:"0",margin:"0"},arrow:{position:"absolute"},reference:{}};return Object.assign(t.elements.popper.style,n.popper),t.styles=n,t.elements.arrow&&Object.assign(t.elements.arrow.style,n.arrow),function(){Object.keys(t.elements).forEach((function(e){var o=t.elements[e],i=t.attributes[e]||{},s=Object.keys(t.styles.hasOwnProperty(e)?t.styles[e]:n[e]).reduce((function(e,t){return e[t]="",e}),{});r(o)&&h(o)&&(Object.assign(o.style,s),Object.keys(i).forEach((function(e){o.removeAttribute(e)})))}))}},requires:["computeStyles"]},Z,{name:"flip",enabled:!0,phase:"main",fn:function(e){var t=e.state,n=e.options,o=e.name;if(!t.modifiersData[o]._skip){for(var i=n.mainAxis,r=void 0===i||i,s=n.altAxis,a=void 0===s||s,c=n.fallbackPlacements,f=n.padding,l=n.boundary,p=n.rootBoundary,d=n.altBoundary,u=n.flipVariations,h=void 0===u||u,m=n.allowedAutoPlacements,v=t.options.placement,g=_(v),y=c||(g===v||!h?[te(v)]:function(e){if(_(e)===M)return[];var t=te(e);return[oe(e),t,oe(t)]}(v)),b=[v].concat(y).reduce((function(e,n){return e.concat(_(n)===M?function(e,t){void 0===t&&(t={});var n=t,o=n.placement,i=n.boundary,r=n.rootBoundary,s=n.padding,a=n.flipVariations,c=n.allowedAutoPlacements,f=void 0===c?I:c,l=X(o),p=l?a?V:V.filter((function(e){return X(e)===l})):C,d=p.filter((function(e){return f.indexOf(e)>=0}));0===d.length&&(d=p);var u=d.reduce((function(t,n){return t[n]=le(e,{placement:n,boundary:i,rootBoundary:r,padding:s})[_(n)],t}),{});return Object.keys(u).sort((function(e,t){return u[e]-u[t]}))}(t,{placement:n,boundary:l,rootBoundary:p,padding:f,flipVariations:h,allowedAutoPlacements:m}):n)}),[]),w=t.rects.reference,x=t.rects.popper,O=new Map,E=!0,j=b[0],L=0;L<b.length;L++){var A=b[L],W=_(A),H=X(A)===S,q=[D,P].indexOf(W)>=0,B=q?"width":"height",R=le(t,{placement:A,boundary:l,rootBoundary:p,altBoundary:d,padding:f}),$=q?H?k:T:H?P:D;w[B]>x[B]&&($=te($));var N=te($),F=[];if(r&&F.push(R[W]<=0),a&&F.push(R[$]<=0,R[N]<=0),F.every((function(e){return e}))){j=A,E=!1;break}O.set(A,F)}if(E)for(var U=function(e){var t=b.find((function(t){var n=O.get(t);if(n)return n.slice(0,e).every((function(e){return e}))}));if(t)return j=t,"break"},z=h?3:1;z>0;z--){if("break"===U(z))break}t.placement!==j&&(t.modifiersData[o]._skip=!0,t.placement=j,t.reset=!0)}},requiresIfExists:["offset"],data:{_skip:!1}},de,ue,{name:"hide",enabled:!0,phase:"main",requiresIfExists:["preventOverflow"],fn:function(e){var t=e.state,n=e.name,o=t.rects.reference,i=t.rects.popper,r=t.modifiersData.preventOverflow,s=le(t,{elementContext:"reference"}),a=le(t,{altBoundary:!0}),c=he(s,o),f=he(a,i,r),l=me(c),p=me(f);t.modifiersData[n]={referenceClippingOffsets:c,popperEscapeOffsets:f,isReferenceHidden:l,hasPopperEscaped:p},t.attributes.popper=Object.assign({},t.attributes.popper,{"data-popper-reference-hidden":l,"data-popper-escaped":p})}}]})},189:(e,t,n)=>{n.d(t,{lP:()=>o});const o={auto:"auto","auto-start":"auto-start","auto-end":"auto-end",top:"top","top-left":"top-start","top-right":"top-end",bottom:"bottom","bottom-left":"bottom-start","bottom-right":"bottom-end",right:"right","right-start":"right-start","right-end":"right-end",left:"left","left-start":"left-start","left-end":"left-end"}},615:(e,t,n)=>{n.d(t,{A:()=>o});class o{constructor(e,t,n){this.el=e,this.options=t,this.events=n,this.el=e,this.options=t,this.events={}}createCollection(e,t){var n;e.push({id:(null===(n=null==t?void 0:t.el)||void 0===n?void 0:n.id)||e.length+1,element:t})}fireEvent(e,t=null){if(this.events.hasOwnProperty(e))return this.events[e](t)}on(e,t){this.events[e]=t}}},926:(e,t,n)=>{n.d(t,{JD:()=>i,gj:()=>o,yd:()=>r});
/*
 * @version: 2.5.0
 * @author: Preline Labs Ltd.
 * @license: Licensed under MIT and Preline UI Fair Use License (https://preline.co/docs/license.html)
 * Copyright 2024 Preline Labs Ltd.
 */
const o=(e,t,n="")=>(window.getComputedStyle(e).getPropertyValue(t)||n).replace(" ","");const i=(e,t,n=null)=>{const o=new CustomEvent(e,{detail:{payload:n},bubbles:!0,cancelable:!0,composed:!1});t.dispatchEvent(o)},r=(e,t)=>{const n=()=>{t(),e.removeEventListener("transitionend",n,!0)},o=window.getComputedStyle(e),i=o.getPropertyValue("transition-duration");"none"!==o.getPropertyValue("transition-property")&&parseFloat(i)>0?e.addEventListener("transitionend",n,!0):t()}}},t={};function n(o){var i=t[o];if(void 0!==i)return i.exports;var r=t[o]={exports:{}};return e[o](r,r.exports,n),r.exports}n.d=(e,t)=>{for(var o in t)n.o(t,o)&&!n.o(e,o)&&Object.defineProperty(e,o,{enumerable:!0,get:t[o]})},n.o=(e,t)=>Object.prototype.hasOwnProperty.call(e,t);var o={};n.d(o,{A:()=>f});var i=n(316),r=n(926),s=n(615),a=n(189);
/*
 * HSTooltip
 * @version: 2.5.0
 * @author: Preline Labs Ltd.
 * @license: Licensed under MIT and Preline UI Fair Use License (https://preline.co/docs/license.html)
 * Copyright 2024 Preline Labs Ltd.
 */
class c extends s.A{constructor(e,t,n){super(e,t,n),this.el&&(this.toggle=this.el.querySelector(".hs-tooltip-toggle")||this.el,this.content=this.el.querySelector(".hs-tooltip-content"),this.eventMode=(0,r.gj)(this.el,"--trigger")||"hover",this.preventPopper=(0,r.gj)(this.el,"--prevent-popper","false"),this.placement=(0,r.gj)(this.el,"--placement"),this.strategy=(0,r.gj)(this.el,"--strategy")),this.el&&this.toggle&&this.content&&this.init()}init(){this.createCollection(window.$hsTooltipCollection,this),"click"===this.eventMode?this.toggle.addEventListener("click",(()=>this.click())):"focus"===this.eventMode?this.toggle.addEventListener("click",(()=>this.focus())):"hover"===this.eventMode&&(this.toggle.addEventListener("mouseenter",(()=>this.enter())),this.toggle.addEventListener("mouseleave",(()=>this.leave()))),"false"===this.preventPopper&&this.buildPopper()}enter(){this.show()}leave(){this.hide()}click(){if(this.el.classList.contains("show"))return!1;this.show();const e=()=>{setTimeout((()=>{this.hide(),this.toggle.removeEventListener("click",e,!0),this.toggle.removeEventListener("blur",e,!0)}))};this.toggle.addEventListener("click",e,!0),this.toggle.addEventListener("blur",e,!0)}focus(){this.show();const e=()=>{this.hide(),this.toggle.removeEventListener("blur",e,!0)};this.toggle.addEventListener("blur",e,!0)}buildPopper(){this.popperInstance=(0,i.n4)(this.toggle,this.content,{placement:a.lP[this.placement]||"top",strategy:this.strategy||"fixed",modifiers:[{name:"offset",options:{offset:[0,5]}}]})}show(){this.content.classList.remove("hidden"),"false"===this.preventPopper&&(this.popperInstance.setOptions((e=>Object.assign(Object.assign({},e),{modifiers:[...e.modifiers,{name:"eventListeners",enabled:!0}]}))),this.popperInstance.update()),setTimeout((()=>{this.el.classList.add("show"),this.fireEvent("show",this.el),(0,r.JD)("show.hs.tooltip",this.el,this.el)}))}hide(){this.el.classList.remove("show"),"false"===this.preventPopper&&this.popperInstance.setOptions((e=>Object.assign(Object.assign({},e),{modifiers:[...e.modifiers,{name:"eventListeners",enabled:!1}]}))),this.fireEvent("hide",this.el),(0,r.JD)("hide.hs.tooltip",this.el,this.el),(0,r.yd)(this.content,(()=>{if(this.el.classList.contains("show"))return!1;this.content.classList.add("hidden")}))}static getInstance(e,t=!1){const n=window.$hsTooltipCollection.find((t=>t.element.el===("string"==typeof e?document.querySelector(e):e)));return n?t?n:n.element.el:null}static autoInit(){window.$hsTooltipCollection||(window.$hsTooltipCollection=[]),document.querySelectorAll(".hs-tooltip").forEach((e=>{window.$hsTooltipCollection.find((t=>{var n;return(null===(n=null==t?void 0:t.element)||void 0===n?void 0:n.el)===e}))||new c(e)}))}static show(e){const t=window.$hsTooltipCollection.find((t=>t.element.el===("string"==typeof e?document.querySelector(e):e)));if(t)switch(t.element.eventMode){case"click":t.element.click();break;case"focus":t.element.focus();break;default:t.element.enter()}}static hide(e){const t=window.$hsTooltipCollection.find((t=>t.element.el===("string"==typeof e?document.querySelector(e):e)));t&&t.element.hide()}static on(e,t,n){const o=window.$hsTooltipCollection.find((e=>e.element.el===("string"==typeof t?document.querySelector(t):t)));o&&(o.element.events[e]=n)}}window.addEventListener("load",(()=>{c.autoInit()})),"undefined"!=typeof window&&(window.HSTooltip=c);const f=c;var l=o.A;export{l as default};