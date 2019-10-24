import { RouteConfig } from 'vue-router'
import Layout from '@/layout/index.vue'

export const excelRouter: RouteConfig = {
  path: '/excel',
  component: Layout,
  redirect: '/excel/export-excel',
  meta: {
    title: 'excel',
    icon: 'excel'
  },
  children: [
    {
      path: 'export-excel',
      component: () => import(/* webpackChunkName: "export-excel" */ '@/views/excel/export-excel.vue'),
      name: 'ExportExcel',
      meta: { title: 'exportExcel' }
    },
    {
      path: 'export-selected-excel',
      component: () => import(/* webpackChunkName: "select-excel" */ '@/views/excel/select-excel.vue'),
      name: 'SelectExcel',
      meta: { title: 'selectExcel' }
    },
    {
      path: 'export-merge-header',
      component: () => import(/* webpackChunkName: "merge-header" */ '@/views/excel/merge-header.vue'),
      name: 'MergeHeader',
      meta: { title: 'mergeHeader' }
    },
    {
      path: 'upload-excel',
      component: () => import(/* webpackChunkName: "upload-excel" */ '@/views/excel/upload-excel.vue'),
      name: 'UploadExcel',
      meta: { title: 'uploadExcel' }
    }
  ]
}
