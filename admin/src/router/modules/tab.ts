import { RouteConfig } from 'vue-router'
import Layout from '@/layout/index.vue'

export const tabRouter: RouteConfig = {
  path: '/tab',
  component: Layout,
  children: [
    {
      path: 'index',
      component: () => import(/* webpackChunkName: "tab" */ '@/views/tab/index.vue'),
      name: 'Tab',
      meta: {
        title: 'tab',
        icon: 'tab'
      }
    }
  ]
}

