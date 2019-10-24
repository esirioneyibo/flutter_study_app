import { RouteConfig } from 'vue-router'
import Layout from '@/layout/index.vue'

export const redirectRouter: RouteConfig = {
  path: '/redirect',
  component: Layout,
  meta: { hidden: true },
  children: [
    {
      path: '/redirect/:path*',
      component: () => import(/* webpackChunkName: "redirect" */ '@/views/redirect/index.vue')
    }
  ]
}
