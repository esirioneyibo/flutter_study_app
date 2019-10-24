import { RouteConfig } from 'vue-router'
import Layout from '@/layout/index.vue'

export const errorLogRouter: RouteConfig = {
  path: '/error-log',
  component: Layout,
  redirect: 'noredirect',
  children: [
    {
      path: 'log',
      component: () => import(/* webpackChunkName: "error-log" */ '@/views/error-log/index.vue'),
      name: 'ErrorLog',
      meta: {
        title: 'errorLog',
        icon: 'bug'
      }
    }
  ]
}
