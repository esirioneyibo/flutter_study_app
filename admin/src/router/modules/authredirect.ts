import { RouteConfig } from 'vue-router'

export const authRedirectRouter: RouteConfig = {
  path: '/auth-redirect',
  component: () => import(/* webpackChunkName: "auth-redirect" */ '@/views/login/auth-redirect.vue'),
  meta: { hidden: true }
}
