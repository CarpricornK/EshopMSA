
<style>
  .loader2{
    width: 100%;
    height: 3000px;
    background-color: white;
    background-blend-mode: darken;
    position: absolute;
  }

  .loader2 > p{
    color: white;
    font-size: 30px;
    position: fixed;
    top:58%;
    left:50%;
    transform: translate(-50%,-50%);
  }

  /*로딩화면*/
  .loader{
    border: 7px solid black;
    border-top: 7px solid #EF8719;
    border-radius: 50%;
    background-color: white;
    width: 60px;
    height: 60px;
    animation: spin .5s linear infinite;
    position: fixed;
    top:50%;
    left:50%;
    z-index: 3;
    transform: translate(-50%,-50%);
  }
  @keyframes spin {
    0% {transform: translate(-50%,-50%) rotate(0deg);}
    100% {transform: translate(-50%,-50%) rotate(360deg);}
  }
</style>

<script src="https://code.jquery.com/jquery-3.6.1.js"
        integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
        crossorigin="anonymous">

</script>

<div class="loader2">
  <p>Loading...</p>
</div>


<div class="loader">

</div>




<script>
  window.onload = function () {
    $(".loader").delay('500').fadeOut('fast');
    $(".loader2").delay('500').fadeOut('fast');
  }
</script>
