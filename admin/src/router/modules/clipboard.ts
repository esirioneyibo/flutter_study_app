import { RouteConfig } from 'vue-router'
import Layout from '@/layout/index.vue'

export const clipboardRouter: RouteConfig = {
  path: '/clipboard',
  component: Layout,
  redirect: 'noredirect',
  children: [
    {
      path: 'index',
      component: () => import(/* webpackChunkName: "clipboard" */ '@/views/clipboard/index.vue'),
      name: 'Clipboard',
      meta: {
        title: 'clipboard',
        icon: 'clipboard'
      }
    }
  ]
}
