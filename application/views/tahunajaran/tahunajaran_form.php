<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <!--section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Menu Management</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">General Form</li>
            </ol>
          </div>
        </div>
      </div>
    </section-->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row d-flex justify-content-center" >
          <!-- left column -->
          <div class="col-md-12" style="margin-top:2px ">
            <!-- general form elements -->
            <?php if ($this->session->flashdata('message')) { ?>
            <div class="alert alert-info" id="info"> <?= $this->session->flashdata('message') ?> </div>
            <?php } ?>
            <div class="card card-light">
              <div class="card-header d-flex justify-content-center">
                <h3 class="card-title"><strong><?php echo $judul;?></strong></h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <?php
                echo form_open_multipart($action, 'role="form" class="form-horizontal" name="tahunajaran"');
            ?>
              <!--form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data"-->
                <div class="card-body">
                  <div class="row d-flex justify-content-center">
                    <div class="col-lg-8">
                      <table width="100%" id="mytable">
                    <tr>
                      <td>
                        <div class="form-group">
                          <label>Tahun Ajaran <?php echo form_error('tahunajaran') ?></label>
                        </div>
                      </td>
                      <td>
                        <div class="form-group">
                          <input type="text" class="form-control col-lg-12" placeholder="Tahun Ajaran" name="tahunajaran" value="<?php echo $tahunajaran; ?>">
                        </div>
                      </td>
                    </tr>
                  </table>
                    </div>
                  </div>

                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <input type="hidden" name="idtahunajaran" value="<?php echo $idtahunajaran; ?>" />
                  <button type="submit" class="btn btn-warning"><?php echo "$button"; ?></button>
                  <a href="<?php echo site_url('tahunajaran') ?>" class="btn btn-success">Cancel</a></td></tr>
                </div>
              </form>

              <!--script>document.mhs.submit();</script-->
            </div>
            <!-- /.card -->

          </div>
          <!--/.col (left) -->
          <!-- right column -->

          <!--/.col (right) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>
