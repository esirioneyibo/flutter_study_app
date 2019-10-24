import { RouteConfig } from 'vue-router'

export const pdfDownloadRouter: RouteConfig = {
  path: '/pdf-download-example',
  component: () => import(/* webpackChunkName: "pdf-download-example" */ '@/views/pdf/download.vue'),
  meta: { hidden: true }
}
