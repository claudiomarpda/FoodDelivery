<%--
  User: mz
  Date: 24/07/17
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<section class="container" ng-app="cartApp">
    <div ng-controller="cartCtrl" ng-init="initCartId('${cartId}')">

        <%--TODO: Allow the client to finish the order--%>
        <div>
            <a class="btn btn-danger pull-left" ng-click="clearCart()"> <span
                    class="glyphicon glyphicon-remove-sign"></span> Clear Cart
            </a> <a href="<spring:url value="/checkout?cartId=${cartId}"/>"
                    class="btn btn-success pull-right"> <span
                class="glyphicon-shopping-cart glyphicon"></span> Check out
        </a>
        </div>
        <table class="table table-hover">
            <tr>
                <th>Product</th>
                <th>Unit price</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
            <tr ng-repeat="item in cart.cartItems">
                <td>{{item.product.id}}-{{item.product.name}}</td>
                <td>{{item.product.price}}</td>
                <td>{{item.quantity}}</td>
                <td>{{item.totalPrice}}</td>
                <td><a href="#" class="label label-danger"
                       ng-click="removeFromCart(item.product.id)"> <span
                        class="glyphicon glyphicon-remove"/></span> Remove
                </a></td>
            </tr>
            <tr>
                <th></th>
                <th></th>
                <th>Grand Total</th>
                <th>{{cart.totalPrice}}</th>
                <th></th>
            </tr>
        </table>

        <a href="<spring:url value="/products" />"
           class="btn btn-default"> <span
                class="glyphicon-hand-left glyphicon"></span> Continue shopping
        </a>
    </div>
</section>