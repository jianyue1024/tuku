<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- CSRF Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}">
  {{--<meta name="_token" content="{{ csrf_token() }}"/>--}}
  <title>@yield('title', 'Laravel') - 盟招图片库</title>
  <!-- 样式 -->
  <link href="{{ mix('css/app.css') }}" rel="stylesheet">
  <script src="../css/style.css"></script>



</head>
<body>
<div id="app">
  @include('layouts._header')
  <div class="container">
    @yield('content')
  </div>
  @include('layouts._footer')
</div>
<!-- JS 脚本 -->
<script src="{{ mix('js/app.js') }}"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/jquery.cookie.js"></script>
@yield('scriptsAfterJs')
</body>
</html>
