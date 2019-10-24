import { RouteConfig } from 'vue-router'

export const loginRouter: RouteConfig = {
  path: '/login',
  component: () => import(/* webpackChunkName: "login" */ '@/views/login/index.vue'),
  meta: { hidden: true }
}
