import { RouteConfig } from 'vue-router'
import Layout from '@/layout/index.vue'

export const zipRouter: RouteConfig = {
  path: '/zip',
  component: Layout,
  redirect: '/zip/download',
  meta: {
    title: 'zip',
    icon: 'zip',
    alwaysShow: true // will always show the root menu
  },
  children: [
    {
      path: 'download',
      component: () => import(/* webpackChunkName: "zip" */ '@/views/zip/index.vue'),
      name: 'ExportZip',
      meta: { title: 'exportZip' }
    }
  ]
}
