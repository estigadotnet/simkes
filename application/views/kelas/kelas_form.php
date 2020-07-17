<div class="content-wrapper">
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
                echo form_open_multipart($action, 'role="form" class="form-horizontal" name="kelas"');
              ?>
              <!--form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data"-->
                <div class="card-body">
                  <div class="row d-flex justify-content-center">
                    <div class="col-lg-8">
                      <table width="100%" id="mytable">
                    <tr>
                      <td>
                        <div class="form-group">
                          <label>Kelas <?php echo form_error('kelas') ?></label>
                        </div>
                      </td>
                      <td>
                        <div class="form-group">
                          <input type="text" class="form-control col-lg-12" placeholder="Kelas" name="kelas" value="<?php echo $kelas; ?>">
                        </div>
                      </td>
                    </tr>

                    <tr>
                      <td>
                        <div class="form-group">
                          <label>Guru <?php echo form_error('namaguru') ?></label>
                        </div>
                      </td>
                      <td>
                        <div class="form-group">
                          <select name="idguru" class="form-control col-lg-4">
                            <?php
                            foreach ($namaguru->result() as $row) {
                            ?>

                            <option  value="<?php echo $row->idguru; ?>" <?php  echo $row->idguru == $idguru?' selected':''; ?>>
                              <?php echo $row->namaguru;?>
                            </option>
                            <?php
                            }
                            ?>
                          </select>
                        </div>
                      </td>
                    </tr>
                  </table>
                    </div>
                  </div>

                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <input type="hidden" name="idkelas" value="<?php echo $idkelas; ?>" />
                  <button type="submit" class="btn btn-warning"><?php echo "$button"; ?></button>
                  <a href="<?php echo site_url('kelas') ?>" class="btn btn-success">Kembali</a></td></tr>
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
