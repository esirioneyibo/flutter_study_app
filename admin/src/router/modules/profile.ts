import { RouteConfig } from 'vue-router'
import Layout from '@/layout/index.vue'

export const profileRouter : RouteConfig = {
  path: '/profile',
  component: Layout,
  redirect: '/profile/index',
  meta: { hidden: true },
  children: [
    {
      path: 'index',
      component: () => import(/* webpackChunkName: "profile" */ '@/views/profile/index.vue'),
      name: 'Profile',
      meta: {
        title: 'profile',
        icon: 'user',
        noCache: true
      }
    }
  ]
}
