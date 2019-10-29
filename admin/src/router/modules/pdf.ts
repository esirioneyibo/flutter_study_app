import { RouteConfig } from 'vue-router'
import Layout from '@/layout/index.vue'

export const pdfRouter: RouteConfig = {
  path: '/pdf',
  component: Layout,
  redirect: '/pdf/index',
  children: [
    {
      path: 'index',
      component: () => import(/* webpackChunkName: "pdf" */ '@/views/pdf/index.vue'),
      name: 'PDF',
      meta: {
        title: 'pdf',
        icon: 'pdf'
      }
    }
  ]
}
