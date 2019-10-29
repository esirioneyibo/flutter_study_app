import { RouteConfig } from 'vue-router'
import Layout from '@/layout/index.vue'

export const i18nRouter: RouteConfig = {
  path: '/i18n',
  component: Layout,
  children: [
    {
      path: 'index',
      component: () => import(/* webpackChunkName: "i18n-demo" */ '@/views/i18n-demo/index.vue'),
      name: 'I18n',
      meta: {
        title: 'i18n',
        icon: 'international'
      }
    }
  ]
}
