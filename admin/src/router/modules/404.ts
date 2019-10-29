import { RouteConfig } from 'vue-router'
export const notFoundRouter: RouteConfig = {
  path: '*',
  redirect: '/404',
  meta: { hidden: true }
}
