import { RouteConfig } from 'vue-router'
import Layout from '@/layout/index.vue'

export const exampleRouter: RouteConfig = {
  path: '/example',
  component: Layout,
  redirect: '/example/list',
  meta: {
    title: 'example',
    icon: 'example'
  },
  children: [
    {
      path: 'create',
      component: () => import(/* webpackChunkName: "example-create" */ '@/views/example/create.vue'),
      name: 'CreateArticle',
      meta: {
        title: 'createArticle',
        icon: 'edit'
      }
    },
    {
      path: 'edit/:id(\\d+)',
      component: () => import(/* webpackChunkName: "example-edit" */ '@/views/example/edit.vue'),
      name: 'EditArticle',
      meta: {
        title: 'editArticle',
        noCache: true,
        activeMenu: '/example/list',
        hidden: true
      }
    },
    {
      path: 'list',
      component: () => import(/* webpackChunkName: "example-list" */ '@/views/example/list.vue'),
      name: 'ArticleList',
      meta: {
        title: 'articleList',
        icon: 'list'
      }
    }
  ]
}
