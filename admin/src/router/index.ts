import Vue from 'vue'
import Router, { RouteConfig } from 'vue-router'
/* Layout */
/* Router modules */
import { componentsRouter } from '@/router/modules/components'
import { chartsRouter } from '@/router/modules/charts'
import { tableRouter } from '@/router/modules/table'
import { nestedRouter } from '@/router/modules/nested'
import { exampleRouter } from '@/router/modules/example'
import { tabRouter } from '@/router/modules/tab'
import { excelRouter } from '@/router/modules/excel'
import { pdfRouter } from '@/router/modules/pdf'
import { permissionRouter } from '@/router/modules/permission'
import { iconRouter } from '@/router/modules/icon'
import { zipRouter } from '@/router/modules/zip'
import { errorRouter } from '@/router/modules/error'
import { errorLogRouter } from '@/router/modules/errorlog'
import { i18nRouter } from '@/router/modules/i18n'
import { externalLinkRouter } from '@/router/modules/externallink'
import { clipboardRouter } from '@/router/modules/clipboard'
import { themeRouter } from '@/router/modules/theme'
import { pdfDownloadRouter } from '@/router/modules/pdfdownload'
import { notFoundRouter } from '@/router/modules/404'
import { guideRouter } from '@/router/modules/guide'
import { homeRouter } from '@/router/modules/home'
import { profileRouter } from '@/router/modules/profile'
import { redirectRouter } from '@/router/modules/redirect'
import { loginRouter } from '@/router/modules/login'
import { authRedirectRouter } from '@/router/modules/authredirect'

Vue.use(Router)

/*
  Note: sub-menu only appear when children.length>=1
  Detail see: https://panjiachen.github.io/vue-element-admin-site/guide/essentials/router-and-nav.html
*/

/*
  name:'router-name'             the name field is required when using <keep-alive>, it should also match its component's name property
                                 detail see : https://vuejs.org/v2/guide/components-dynamic-async.html#keep-alive-with-Dynamic-Components
  redirect:                      if set to 'noredirect', no redirect action will be trigger when clicking the breadcrumb
  meta: {
    roles: ['admin', 'editor']   will control the page roles (allow setting multiple roles)
    title: 'title'               the name showed in subMenu and breadcrumb (recommend set)
    icon: 'svg-name'             the icon showed in the sidebar
    hidden: true                 if true, this route will not show in the sidebar (default is false)
    alwaysShow: true             if true, will always show the root menu (default is false)
                                 if false, hide the root menu when has less or equal than one children route
    breadcrumb: false            if false, the item will be hidden in breadcrumb (default is true)
    noCache: true                if true, the page will not be cached (default is false)
    affix: true                  if true, the tag will affix in the tags-view
    activeMenu: '/example/list'  if set path, the sidebar will highlight the path you set
  }
*/

/**
 ConstantRoutes
 a base page that does not have permission requirements
 all roles can be accessed
 */
export const constantRoutes: RouteConfig[] = [
  redirectRouter,
  loginRouter,
  authRedirectRouter,
  errorRouter,
  homeRouter,
  guideRouter,
  profileRouter
]

/**
 * asyncRoutes
 * the routes that need to be dynamically loaded based on user roles
 */
export const asyncRoutes: RouteConfig[] = [
  permissionRouter,
  iconRouter,
  componentsRouter,
  chartsRouter,
  nestedRouter,
  tableRouter,
  exampleRouter,
  tabRouter,
  errorRouter,
  errorLogRouter,
  excelRouter,
  zipRouter,
  pdfRouter,
  pdfDownloadRouter,
  themeRouter,
  clipboardRouter,
  i18nRouter,
  externalLinkRouter,
  notFoundRouter
]

const createRouter = () => new Router({
  // mode: 'history',  // Disabled due to Github Pages doesn't support this, enable this if you need.
  scrollBehavior: (to, from, savedPosition) => {
    if (savedPosition) {
      return savedPosition
    } else {
      return { x: 0, y: 0 }
    }
  },
  base: process.env.BASE_URL,
  routes: constantRoutes
})

const router = createRouter()

// Detail see: https://github.com/vuejs/vue-router/issues/1234#issuecomment-357941465
export function resetRouter() {
  const newRouter = createRouter();
  (router as any).matcher = (newRouter as any).matcher // reset router
}

export default router
