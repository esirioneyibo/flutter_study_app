import { RouteConfig } from 'vue-router'
import Layout from '@/layout/index.vue'

export const themeRouter: RouteConfig = {
  path: '/theme',
  component: Layout,
  redirect: 'noredirect',
  children: [
    {
      path: 'index',
      component: () => import(/* webpackChunkName: "theme" */ '@/views/theme/index.vue'),
      name: 'Theme',
      meta: {
        title: 'theme',
        icon: 'theme'
      }
    }
  ]
}
