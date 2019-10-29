import { RouteConfig } from 'vue-router'
import Layout from '@/layout/index.vue'

export const externalLinkRouter: RouteConfig = {
  path: '/external-link',
  component: Layout,
  children: [
    {
      path: 'https://github.com/Armour/vue-typescript-admin-template',
      meta: {
        title: 'externalLink',
        icon: 'link'
      }
    }
  ]
}
