import { RouteConfig } from 'vue-router'
import Layout from '@/layout/index.vue'

export const iconRouter: RouteConfig = {
  path: '/icon',
  component: Layout,
  children: [
    {
      path: 'index',
      component: () => import(/* webpackChunkName: "icons" */ '@/views/icons/index.vue'),
      name: 'Icons',
      meta: {
        title: 'icons',
        icon: 'icon',
        noCache: true
      }
    }
  ]
}
