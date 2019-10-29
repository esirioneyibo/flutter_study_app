import { RouteConfig } from 'vue-router'
import Layout from '@/layout/index.vue'

export const guideRouter: RouteConfig = {
  path: '/guide',
  component: Layout,
  redirect: '/guide/index',
  children: [
    {
      path: 'index',
      component: () => import(/* webpackChunkName: "guide" */ '@/views/guide/index.vue'),
      name: 'Guide',
      meta: {
        title: 'guide',
        icon: 'guide',
        noCache: true
      }
    }
  ]
}
