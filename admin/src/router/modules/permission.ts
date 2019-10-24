import { RouteConfig } from 'vue-router'
import Layout from '@/layout/index.vue'

export const permissionRouter: RouteConfig = {
  path: '/permission',
  component: Layout,
  redirect: '/permission/directive',
  meta: {
    title: 'permission',
    icon: 'lock',
    roles: ['admin', 'editor'], // you can set roles in root nav
    alwaysShow: true // will always show the root menu
  },
  children: [
    {
      path: 'page',
      component: () => import(/* webpackChunkName: "permission-page" */ '@/views/permission/page.vue'),
      name: 'PagePermission',
      meta: {
        title: 'pagePermission',
        roles: ['admin'] // or you can only set roles in sub nav
      }
    },
    {
      path: 'directive',
      component: () => import(/* webpackChunkName: "permission-directive" */ '@/views/permission/directive.vue'),
      name: 'DirectivePermission',
      meta: {
        title: 'directivePermission'
        // if do not set roles, means: this page does not require permission
      }
    },
    {
      path: 'role',
      component: () => import(/* webpackChunkName: "permission-role" */ '@/views/permission/role.vue'),
      name: 'RolePermission',
      meta: {
        title: 'rolePermission',
        roles: ['admin']
      }
    }
  ]
}
