import { RouteConfig } from 'vue-router'
const Login = () => import(/* webpackChunkName: "login" */ '@/views/login/index.vue')
export const loginRouter: RouteConfig = {
  path: '/login',
  component: Login,
  meta: { hidden: true }
}
