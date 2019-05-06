
                    </div>

                </div>
            </div>
        </section>

        <!-- Blog Section -->

            <div class="container">


            </div>
        </section>

        <!-- Footer Section -->
        <section id="foot"></section>
        <footer >
            <div class="container">
                <div class="row">

                    <div class="col-md-5 col-md-offset-1 col-sm-6">
                        <h3> CANCER CLASSIFICATION SYSTEM </h3>
                        <p>machine learning based classification technique for cancerous profiles</p>
                        <div class="footer-copyright">
                            <p>DEVELOPED BY: SAYUJIA S,ROSHNI S,MERIN KUREIN ,POOJA S,SALINI J R</p>
                        </div>
                    </div>

                    <div class="col-md-4 col-md-offset-1 col-sm-6">
                        <h3>Talk to us</h3>
                        <p><i class="fa fa-globe"></i> LBS College of Engineering</p>
                        <p><i class="fa fa-phone"></i> 9074351493,9074600327</p>
                        <a href="cancerclassificationservice.in">roshnisaramathew21@gmail.com,<br>sayu.sayujia17@gmail.com</a>

                    </div>

                    <div class="clearfix col-md-12 col-sm-12">
                        <hr>
                    </div>

                    <div class="col-md-12 col-sm-12">
                        <ul class="social-icon">
                            <li><a href="#" class="fa fa-facebook"></a></li>
                            <li><a href="#" class="fa fa-twitter"></a></li>
                            <li><a href="#" class="fa fa-google-plus"></a></li>
                            <li><a href="#" class="fa fa-dribbble"></a></li>
                            <li><a href="#" class="fa fa-linkedin"></a></li>
                        </ul>
                    </div>

                </div>
            </div>
        </footer>

        <!-- Back top -->
        <a href="#back-top" class="go-top"><i class="fa fa-angle-up"></i></a>

        <!-- SCRIPTS -->

        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/particles.min.js"></script>
        <script src="js/app.js"></script>
        <script src="js/jquery.parallax.js"></script>
        <script src="js/smoothscroll.js"></script>
        <script src="js/custom.js"></script>
        <script>
            function togglenow( data)
            {
             $("#roster"+data).fadeToggle(500);
             $("#roster"+data).css("z-index",999);
             if($("#roster"+data).css('opacity')=="0")
             {
                $("#down"+data).css("transform","scaleY(-1)");
             }
             else
                 $("#down"+data).css("transform","scaleY(1)");
           //  alert($("#roster"+data).css('opacity'));
            }
            
        </script>
<script>
    var seloption = 0;
    window.onmousedown = function (e) {
        var el = e.target;
        if (el.tagName.toLowerCase() == 'option' && el.parentNode.hasAttribute('multiple')) {
            e.preventDefault();

            // toggle selection
            if (el.hasAttribute('selected'))
            {
                el.removeAttribute('selected');
                seloption--;

                document.getElementById("selsym").innerHTML = seloption;
            } else {
                el.setAttribute('selected', '');
                seloption++;
                document.getElementById("selsym").innerHTML = seloption;
            }


            // hack to correct buggy behavior
            var select = el.parentNode.cloneNode(true);
            el.parentNode.parentNode.replaceChild(select, el.parentNode);

        }
    }
</script>
    </body>
</html>