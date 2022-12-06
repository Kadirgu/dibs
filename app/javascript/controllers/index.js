import { application } from "./application"

import ChatroomSubscriptionController from "./chatroom_subscription_controller"
application.register("chatroom-subscription", ChatroomSubscriptionController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import MapController from "./map_controller"
application.register("map", MapController)

import ProductFormController from "./product_form_controller"
application.register("product-form", ProductFormController)

import SearchProductsController from "./search_products_controller"
application.register("search-products", SearchProductsController)
